require 'rails_helper'

RSpec.describe 'Area Facade' do
 it 'is an array of zone objects' do
  areas = AreaFacade.area_details

  expect(areas).to be_an Array
  expect(areas.count).to eq(10)

  areas.each do |area|
   expect(area.name).to be_a String
   expect(area.state).to be_a String
   expect(area.url).to be_a String
   expect(area.zone_id).to be_a String
  end
 end
end
