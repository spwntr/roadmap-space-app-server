require 'rubygems'
require 'bundler/setup'
require 'haml'
require 'dalli'
require 'pry-debugger'
require 'sinatra' unless defined?(Sinatra)

set :cache, Dalli::Client.new

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Road Map Space Server Application',
                 :author => 'DKL',
                 :url_base => 'http://localhost:4567/'
               )
 
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
