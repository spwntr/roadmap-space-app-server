require 'space_agency_site'
class Science1 < SpaceAgencySite
  def initialize 
    super "/home/dimitar/Downloads/missions.html" 
  end
  
  def get_missions
    nokogiri_doc = super
    parsed_response = parse_response nokogiri_doc
  end

  def mission_count 
    get_missions.count
  end 

  private
  def parse_response response
    ret = []
    response.css('div#content table tr').each do |tr|
      mission = Mission.new({})
      mission.description = tr.css('div.desc div')[0].text if tr.css('div.desc div')[0]
      mission.title = tr.css('a')[0].text.strip if tr.css('a')[0]
      mission.url =  tr.css('a')[0].attributes['href'].value if tr.css('a')[0]
      ret << mission
    end
    ret
  end 
end
