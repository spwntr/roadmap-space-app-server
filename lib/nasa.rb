class Nasa < SpaceAgencySite 
  def initialize 
    super 'http://www.nasa.gov/ws/latest_events.jsonp?format_output=1&display_id=page_1&Calendars=6089&Collections=6171&andor=1&start=Sat%20Apr%2012%202014' 
  end
  def get_missions
    nokogiri_doc = super
    parsed_data = parse_response nokogiri_doc  
    convert_to_mission_model parsed_data
  end

  private 
  def parse_response response
    JSON.parse response
  end
  def convert_to_mission_model data
    missions = []
    data["nodes"].each do |el|
      missions = Mission.new :title=>el["node"]["title"]
    end
    missions
  end
end
