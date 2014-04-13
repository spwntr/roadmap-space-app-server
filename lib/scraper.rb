require 'open-uri'
require 'nokogiri'

class Scraper
  def scrape url
    doc = Nokogiri::HTML((open url))
  end
end
