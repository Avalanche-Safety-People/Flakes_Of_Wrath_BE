require 'rails_helper'

RSpec.describe Area do
 before :each do
  # @data = {
  #  id: 7,
  #  name: "West Slopes North",
  #  state: "WA",
  #  url: "http://www.nwac.us/avalanche-forecast/#/west-slopes-north",
  #  zone_id: "4"
  # }
  # @area = Area.new(@data)
    @area = AreaFacade.single_area(419)
 end

 it 'is an instance of Area', :vcr do
  expect(@area).to be_an_instance_of(Area)
 end

 it 'has attributes', :vcr do
  expect(@area.name).to eq("West Slopes North")
  expect(@area.name).to be_a String
  expect(@area.state).to eq("WA")
  expect(@area.state).to be_a String
  expect(@area.url).to eq("http://www.nwac.us/avalanche-forecast/#/west-slopes-north")
  expect(@area.url).to be_a String
  expect(@area.zone_id).to eq("4")
  expect(@area.zone_id).to be_a String
 end

 it 'can return an 8 day avalanche danger forecast', :vcr do
    areas = AreaFacade.area_details
    area = areas.first

    expect(area.av_danger).to be_a Array
    expect(area.av_danger).to be_a Integer
    expect(area.av_danger.count).to eq 8
  end

  it 'can return a single area information and av_risk', :vcr do
    area = AreaFacade.single_area(419)
  end
end
