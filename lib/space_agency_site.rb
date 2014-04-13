class SpaceAgencySite < Scraper
  def initialize url
    @url = url 
  end
   
  def get_missions
    scrape url
  end
end
