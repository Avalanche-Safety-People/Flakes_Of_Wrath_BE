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

    it 'can update an existing emergency contact' do
      emergency_contact = create(:emergency_contact, user_id: @user.id)

      new_emergency_contact_params = { name: "Mr. Brightside" }
      headers = {"CONTENT_TYPE" => "application/json"}
      
      patch "/api/v1/users/#{@user.id}/emergency_contacts", headers: headers, params: JSON.generate({emergency_contact: new_emergency_contact_params})

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      emergency_contact = EmergencyContact.last
      expect(emergency_contact.name).to eq(new_emergency_contact_params[:name])
      expect(emergency_contact.phone_number).to eq(emergency_contact.phone_number)
      expect(emergency_contact.user_id).to eq(emergency_contact.user_id)
    end

    it 'will return a data hash with a nil id if no contact is found' do
      new_emergency_contact_params = { name: "Mr. Brightside" }
      headers = {"CONTENT_TYPE" => "application/json"}
      
      patch "/api/v1/users/#{@user.id}/emergency_contacts", headers: headers, params: JSON.generate({emergency_contact: new_emergency_contact_params})

      expect(response.body).to eq('{"data":{"id":null,"type":"emergency_contact"}}')
    end

    it 'can update an existing emergency contact' do
      emergency_contact = create(:emergency_contact, user_id: @user.id)

      new_emergency_contact_params = { name: "" }
      headers = {"CONTENT_TYPE" => "application/json"}
      
      patch "/api/v1/users/#{@user.id}/emergency_contacts", headers: headers, params: JSON.generate({emergency_contact: new_emergency_contact_params})

      error_response = JSON.parse(response.body, symbolize_names: true)
      expect(error_response).to have_key(:error)
      expect(error_response).to_not have_key(:data)
      expect(error_response[:error]).to eq('contact unsuccessfully updated')
      expect(response).to have_http_status(404)
    end

    describe "As a developer, when I send a get request to the emergency contacts endpoint:(baseurl.com/api/v1/users/:user_id/emergency_contacts)" do
      it "I see a json response object with the emergency contacts for that user with the attributes: name, phone_number, user_id" do
        emergency_contact = create(:emergency_contact, user_id: @user.id)

        get "/api/v1/users/#{@user.id}/emergency_contacts"

        expect(response).to be_successful

        contacts = JSON.parse(response.body, symbolize_names: true)
 
        contacts[:data].each do |data|
          expect(data[:attributes]).to have_key(:name)
          expect(data[:attributes][:name]).to be_a(String)
  
          expect(data[:attributes]).to have_key(:phone_number)
          expect(data[:attributes][:phone_number]).to be_a(String)
  
          expect(data[:attributes]).to have_key(:user_id)
          expect(data[:attributes][:user_id]).to be_an(Integer)
        end
      end
    end
  end
end
