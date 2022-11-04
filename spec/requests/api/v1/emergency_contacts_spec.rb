require 'rails_helper'

RSpec.describe "EmergencyContacts", type: :request do
  describe "Emergency contacts controller" do
    before(:each) do
      @user = create(:user)
      @emergency_contact_params = {
        name: "THERE IS NO BRIGHT SIDE",
        phone_number: '2022022022',
        user_id: @user.id
      }
    end

    it 'can create a successful emergency_contact' do
      post "/api/v1/users/#{@user.id}/emergency_contacts", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(emergency_contact: @emergency_contact_params)

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      emergency_contact = EmergencyContact.last
      expect(emergency_contact.name).to eq(@emergency_contact_params[:name])
      expect(emergency_contact.phone_number).to eq(@emergency_contact_params[:phone_number])
      expect(emergency_contact.user_id).to eq(@emergency_contact_params[:user_id])
    end
  end
end
