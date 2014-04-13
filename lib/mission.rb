require 'json'

class Mission 
  attr_accessor :attributes, :title, :url, :summary, :description, :date, :image
  
  def initialize attributes
    @title = attributes[:title] || ""
    @url = attributes[:url] || ""
    @summary = attributes[:summaryhttttt] || ""
    @date = attributes[:date] || ""
    @description = attributes[:description] || ""
    @image = attributes[:image] || ""

  end
  
  def to_json
    {'title'=> @title,
     'url'=> @url, 
     'summary'=> @summary, 
     'description'=> @description, 
     'date'=> @date,
     'image' => @image

    }.to_json
  end
end
