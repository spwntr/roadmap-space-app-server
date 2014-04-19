
require "#{File.dirname(__FILE__)}/../spec_helper"
describe 'science1' do 
  it 'returns 209 records' do 
    Scinece1.new.mission_count.should eq 209
  end

end

