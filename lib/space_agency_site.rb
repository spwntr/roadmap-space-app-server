require 'scraper'

class SpaceAgencySite < Scraper
  attr :missions, :url
  
  def initialize url
    @url = url 
  end
   
  def get_missions
    scrape url
  end
end
