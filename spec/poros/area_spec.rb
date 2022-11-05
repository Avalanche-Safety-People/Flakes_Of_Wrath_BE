require 'rails_helper'

RSpec.describe Area do
 before :each do
  @area = AreaFacade.area_details.first
 end

 it 'is an instance of Area', :vcr do
  expect(@area).to be_an_instance_of(Area)
 end

 it 'has attributes', :vcr do
  expect(@area.name).to eq("Olympics")
  expect(@area.name).to be_a String
  expect(@area.state).to eq("WA")
  expect(@area.state).to be_a String
  expect(@area.zone_id).to eq(419)
  expect(@area.zone_id).to be_a Integer
 end

  it 'can return a 5 day avalanche danger forecast', :vcr do
    areas = AreaFacade.area_details
    area = areas.first

    expect(area.av_danger).to be_a Array
  end
end