require 'rails_helper'

RSpec.describe Area do
 before :each do
  @data = {
   id: 7,
   name: "West Slopes North",
   state: "WA",
   url: "http://www.nwac.us/avalanche-forecast/#/west-slopes-north",
   zone_id: "4"
  }

  @area = Area.new(@data)
 end

 it 'is an instance of Area' do
  expect(@area).to be_an_instance_of(Area)
 end

 it 'has attributes' do
  expect(@area.name).to eq("West Slopes North")
  expect(@area.name).to be_a String
  expect(@area.state).to eq("WA")
  expect(@area.state).to be_a String
  expect(@area.url).to eq("http://www.nwac.us/avalanche-forecast/#/west-slopes-north")
  expect(@area.url).to be_a String
  expect(@area.zone_id).to eq("4")
  expect(@area.zone_id).to be_a String
 end
end