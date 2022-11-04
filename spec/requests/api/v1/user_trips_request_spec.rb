require 'rails_helper'

RSpec.describe 'User trips' do 
  describe 'As a developer, when visit the user trips show path' do 
    it 'I send a single trip' do 
      user = create(:user)
      trip_data = create(:trip, user_id: user.id)

      get api_v1_user_trip_path(trip_data.user_id, trip_data.id)
      expect(response).to be_successful
      trip = JSON.parse(response.body, symbolize_names: true)
      expect(trip).to be_a Hash
      expect(trip[:data]).to have_key :id
      expect(trip[:data][:attributes]).to have_key :name
      expect(trip[:data][:attributes][:zone_id]).to be_an Integer
      expect(trip[:data][:attributes]).to have_key :start_date
      expect(trip[:data][:attributes]).to have_key :description
      expect(trip[:data][:attributes]).to have_key :user_id
    end

    it 'I can send all trips belonging to a user' do 
      user = create(:user)
      trips_data = create_list(:trip, 5, user_id: user.id)

      get api_v1_user_trips_path(user.id)
      expect(response).to be_successful
      trips = JSON.parse(response.body, symbolize_names: true)
      expect(trips).to be_a Hash
      expect(trips[:data]).to be_an Array
    end

    it 'I can create a trip for a user' do 
      user = create(:user)
      # new_trip_params = ({
      #   name: 'asdasd',
      #   zone_id: '123',
      #   start_date: Date.new(2023, 3, 2),
      #   description: 'very snowy',
      #   user_id: user.id
      # })
      new_trip_params = (attributes_for(:trip, user_id: user.id))

      # trip_data = create(:trip, user_id: user.id)
      post api_v1_user_trips_path(user.id), params: JSON.generate(new_trip_params)
      # trips_data = create_list(:trip, 5, user_id: user.id)
      binding.pry

      # get api_v1_user_trips_path(user.id)
      # expect(response).to be_successful
      # trips = JSON.parse(response.body, symbolize_names: true)
      # expect(trips).to be_a Hash
      # expect(trips[:data]).to be_an Array
    end
  end
end
