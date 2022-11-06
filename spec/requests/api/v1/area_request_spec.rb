require 'rails_helper'

RSpec.describe 'AreasController', type: :request do
  describe 'Area Index' do
    before(:each) do
    end
  end

  describe 'As a developer, when I query the Area Show endpoint (baseurl/api/v1/area/:area_id)' do
    it 'returns formatted json for a specific area', :vcr do
      get api_v1_area_path(419)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to be_an Hash
    end
  end
end
