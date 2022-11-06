require 'rails_helper'

RSpec.describe 'Area Service', :vcr do
  it 'gets a response for all areas in the state' do
    areas = AreaService.areas

    expect(areas).to be_an Array

    areas.each do |area|
      expect(area).to have_key(:id)
      expect(area[:id]).to be_an Integer
      details = area[:properties]
      expect(details).to have_key(:name)
      expect(details[:name]).to be_a String
      expect(details).to have_key(:link)
      expect(details[:link]).to be_a String
      expect(details).to have_key(:state)
      expect(details[:state]).to be_a String
      expect(details).to have_key(:travel_advice)
      expect(details[:travel_advice]).to be_a String
      expect(details).to have_key(:danger_level)
      expect(details[:danger_level]).to be_a Integer
      expect(details).to have_key(:start_date)
      expect(details).to have_key(:off_season)
    end
  end
end
