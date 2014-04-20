require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require File.join(File.dirname(__FILE__), 'environment')

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  haml :root
end

post '/client_registration' do
  registration_id = params[:registration_id]
  @existing_registration_ids = settings.cache.fetch("roadmap_spacemap_client_ids") || []
  @existing_registration_ids << registration_id
  settings.cache.set("roadmap_spacemap_client_ids", @existing_registration_ids, 0)
end

get '/missions/nasa' do
  content_type :json
  "{\"missions\": #{Nasa.new.get_missions.to_json}}"
end

