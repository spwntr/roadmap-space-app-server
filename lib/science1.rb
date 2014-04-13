require 'space_agency_site'
class Science1 < SpaceAgencySite
  def initialize 
    super "http://science1.nasa.gov/missions/" 
  end
  
  def get_missions
    nokogiri_doc = super
    parsed_response = parse_response nokogiri_doc
  end

  private
  def parse_response response
    ret = []
    response.css("table.missions tr")[0]

  end 
end
