require 'rails_helper'

RSpec.describe 'AreasController', type: :request do
  describe 'Area Index' do
    before(:each) do
    end
  end


  describe 'As a developer, when I query the Area Show endpoint (baseurl/api/v1/area/:area_id)' do
    context "happy path" do
      it 'returns formatted data for a specific area', :vcr do
        get api_v1_area_path(419)

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_an Hash

        data = json[:data]

        expect(data).to be_an Hash
        expect(data).to have_key(:id)
        expect(data[:id]).to be_a String
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("area")
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to be_a Hash

        attributes = data[:attributes]

        expect(attributes).to have_key(:current_av_risk)
        expect(attributes[:current_av_risk]).to be_a Integer
        expect(attributes).to have_key(:start_date)
        expect(attributes[:start_date]).to be_a String
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a String
        expect(attributes).to have_key(:state)
        expect(attributes[:state]).to be_a String
        expect(attributes).to have_key(:travel_advice)
        expect(attributes[:travel_advice]).to be_a String
        expect(attributes).to have_key(:url)
        expect(attributes[:url]).to be_a String
        expect(attributes).to have_key(:av_danger)
        expect(attributes[:av_danger]).to be_a Array
        expect(attributes).to have_key(:lat_long)
        expect(attributes[:lat_long]).to be_a Array
      end
    end
    context "sad path" do
      xit 'returns a hash indicating a failure when I query for a zone that does not exist', :vcr do
        get api_v1_area_path(500)
      end
    end
  end

  describe 'As a developer, when I query the Area Index endpoint (basurl/api/v1/area/:area_id)' do
    xit 'returns json containing a nested array', :vcr do
      get api_v1_areas_path

      json = JSON.parse(response.body, symbolize_names: true)

      data = json[:data].first

      expect(data).to be_an Hash
      expect(data).to have_key(:id)
      expect(data[:id]).to be_a String
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("area")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a Hash

      attributes = data[:attributes]

      expect(attributes).to have_key(:current_av_risk)
      expect(attributes[:current_av_risk]).to be_a Integer
      expect(attributes).to have_key(:start_date)
      expect(attributes[:start_date]).to be_a String
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a String
      expect(attributes).to have_key(:state)
      expect(attributes[:state]).to be_a String
      expect(attributes).to have_key(:travel_advice)
      expect(attributes[:travel_advice]).to be_a String
      expect(attributes).to have_key(:url)
      expect(attributes[:url]).to be_a String
      expect(attributes).to have_key(:av_danger)
      expect(attributes[:av_danger]).to be_a Array
      expect(attributes).to have_key(:lat_long)
      expect(attributes[:lat_long]).to be_a Array
    end
  end
end
