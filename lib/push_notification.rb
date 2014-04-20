require 'faraday'
require 'json'

class PushNotification
	attr_accessor :attributes, :post_url, :api_key, :content_type, :registration_ids

	def initialize attributes
		@post_url = attributes[:post_url] || 'https://android.googleapis.com/gcm/send'
		@api_key = attributes[:api_key] || "this needs to be retrieved from Luis' Google Dev Console"
		@content_type = attributes[:content_type] || 'application/json'
		@registration_ids = settings.cache.fetch("roadmap_spacemap_client_ids") || []
	end

	def send_push
		push_call = Faraday.new(:url => @post_url) do |faraday|
		  faraday.request  :url_encoded
		  faraday.response :logger
		  faraday.adapter  Faraday.default_adapter
		end

	  push_call.post do |req|
		  req.headers['Content-Type'] = @content_type
		  req.headers['Authorization'] = @api_key
		  req.body = "{ \"registration_ids\": #{@registration_ids} }"
		end
	end
end