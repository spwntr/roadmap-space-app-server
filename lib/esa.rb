class Esa< SpaceAgencySite 
  
  def initialize 
    super 'http://www.esa.int/ESA/Our_Missions' 
  end

  def get_missions
    nokogiri_doc = super
 
  end
   

end
