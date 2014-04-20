require 'faraday'
require 'json'

class PushNotification
	def send_push(params)
		@post_url = 'https://android.googleapis.com/gcm/send'
		@api_key = 'key=AIzaSyDy0319hOcsfPqlbamNRiHp-ijyYgxQwGw' 							#this needs to be local
		@project_id = '171639698085'																					#this too
		@content_type = 'application/json'
		@registration_ids = params || []

		push_call = Faraday.new(:url => @post_url) do |faraday|
		  faraday.request  :url_encoded
		  faraday.response :logger
		  faraday.adapter  Faraday.default_adapter
		end

	  response = push_call.post do |req|
		  req.headers['Content-Type'] = @content_type
		  req.headers['Authorization'] = @api_key
		  req.headers['project_id'] = @project_id
		  req.body = "{ \"registration_ids\": #{@registration_ids} }"
		  puts "REQUEST: \n #{req}"																					#just for debugging
		end
		puts "\nRESPONSE: \n #{response.inspect}"														#just for debugging
	end
end