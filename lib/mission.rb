require 'json'

class Mission 
  attr_accessor :attributes, :title, :url, :summary, :description, :date
  
  def initialize attributes
    @title = attributes[:title] || ""
    @url = attributes[:url] || ""
    @summary = attributes[:summaryhttttt] || ""
    @date = attributes[:date] || ""
    @description = attributes[:description] || ""
  end
  
  def to_json
    {'title'=> @title,
     'url'=> @url, 
     'summary'=> @summary, 
     'description'=> @description, 
     'date'=> @date
    }.to_json
  end
end
