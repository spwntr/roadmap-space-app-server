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

get '/missions' do
  content_type :json
  [Nasa.new.get_missions + Esa.new.get_missions].to_json
end
get '/missions/nasa' do 
  Nasa.new.get_missions.to_json
end
