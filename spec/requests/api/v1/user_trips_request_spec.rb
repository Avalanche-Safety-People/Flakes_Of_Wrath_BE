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
      new_trip_params = {
        name: 'asdasd',
        zone_id: '123',
        start_date: Date.new(2023, 3, 2),
        description: 'very snowy',
        user_id: user.id
      }
      new_trip_params = (attributes_for(:trip, user_id: user.id))

      post api_v1_user_trips_path(user.id), params: new_trip_params

      expect(response).to be_successful
    end

    describe "As a developer, I can send a destroy request to the user trips endpoint" do
      it "and get back a 204 success response to indicate that the entry has been successfully destroyed." do
        user = create(:user)
        trip_data = create(:trip, user_id: user.id)

        delete api_v1_user_trip_path(trip_data.user_id, trip_data.id)

        expect(response).to be_successful
        expect(Trip.count).to eq(0)
        expect(response.status).to eq(204)
        expect(response.body).to eq("")
        expect{Trip.find(trip_data.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    it 'can update an existing trip' do
      user = create(:user)
      trip = create(:trip, user_id: user.id)

      new_trip_params = { name: "Ryan's Ski Party feat Jake", start_date: Date.new(2023, 3, 2) }
      headers = {"CONTENT_TYPE" => "application/json"}
      
      patch "/api/v1/users/#{user.id}/trips/#{trip.id}", headers: headers, params: JSON.generate({trip: new_trip_params})

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      trip = Trip.last
      expect(trip.name).to eq(new_trip_params[:name])
      expect(trip.zone_id).to eq(trip.zone_id)
      expect(trip.start_date).to eq(new_trip_params[:start_date])
      expect(trip.description).to eq(trip.description)
      expect(trip.user_id).to eq(trip.user_id)
    end
  end
end
