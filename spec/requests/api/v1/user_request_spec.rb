require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "has a route" do
    before :each do
      @user_1 = User.create!(uid: "107509505203685220862", provider: "google_oauth2", name: "Gavin", email: "gavin@guhmail.com")
    end

    # it "GET /api/v1/users" do
    #   user = File.read("spec/fixtures/user_example.json")
      
    # end

    it 'I can update a user' do
      user = create(:user, favorite_zone: nil)
      new_trip_params = {
        favorite_zone: 419
      }
      patch api_v1_user_path(user.id), params: new_trip_params
      updated_user = User.find(user.id)

      expect(response).to be_successful
      expect(updated_user.favorite_zone).to eq 419
    end
  end
end
