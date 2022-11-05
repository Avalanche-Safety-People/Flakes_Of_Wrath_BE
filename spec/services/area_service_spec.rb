require 'rails_helper'

RSpec.describe 'Area Service', :vcr do
  it 'gets a response for all areas in the state' do
    areas = AreaService.areas

    expect(areas).to be_an Array

    areas.each do|area|
      expect(area).to have_key(:id)
      expect(area[:id]).to be_an Integer
      expect(area).to have_key(:name)
      expect(area[:name]).to be_a String
      expect(area).to have_key(:url)
      expect(area[:url]).to be_a String
      expect(area).to have_key(:state)
      expect(area[:state]).to be_a String
      expect(area).to have_key(:zone_id)
      expect(area[:zone_id]).to be_a String
    end
  end
end