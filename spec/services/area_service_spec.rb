require 'rails_helper'

RSpec.describe 'Area Service', :vcr do
  it 'gets a response for all areas in the state' do
    areas = AreaService.areas

    expect(areas).to be_an Array

    areas.each do|area|

      expect(area).to have_key(:id)
      expect(area[:id]).to be_an Integer
      expect(area).to have_key(:properties)
      expect(area[:properties]).to be_a Hash
      data = area[:properties]
      expect(data).to have_key(:name)
      expect(data[:name]).to be_a String
      expect(data).to have_key(:link)
      expect(data[:link]).to be_a String
      expect(data).to have_key(:state)
      expect(data[:state]).to be_a String
      expect(data).to have_key(:start_date)
      expect(data).to have_key(:end_date)
      expect(data).to have_key(:danger_level)
      expect(data[:danger_level]).to be_an Integer
      expect(data).to have_key(:travel_advice)
      expect(data[:travel_advice]).to be_an String
    end
  end
end