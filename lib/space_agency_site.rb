class SpaceAgencySite < Scraper
  attr_accessor :url
  def initialize url
    @url = url 
  end
   
  def get_missions
    scrape url
  end
end
