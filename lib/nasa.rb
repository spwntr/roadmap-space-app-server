class Nasa < SpaceAgencySite 
  
  def initialize 
    super 'http://www.nasa.gov/missions/schedule/index.html#.U0l6rabaY8E' 
  end

  def get_missions
    nokogiri_doc = super
 
  end
   

end
