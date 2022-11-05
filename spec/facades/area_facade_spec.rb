require 'rails_helper'

RSpec.describe 'Area Facade', :vcr do
 it 'creates an array of zone objects' do
  areas = AreaFacade.area_details

  expect(areas).to be_an Array
  expect(areas.count).to eq(10)

  areas.each do |area|
   expect(area.name).to be_a String
   expect(area.state).to be_a String
   expect(area.url).to be_a String
   expect(area.zone_id).to be_a Integer
  end
 end
end
