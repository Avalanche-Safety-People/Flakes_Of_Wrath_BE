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
      post "/api/v1/users/#{@user.id}/emergency_contacts", params: @emergency_contact_params

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

      patch "/api/v1/users/#{@user.id}/emergency_contacts/#{emergency_contact.id}",params: new_emergency_contact_params

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      updated_emergency_contact = EmergencyContact.last

      expect(updated_emergency_contact.name).to eq(new_emergency_contact_params[:name])
      expect(updated_emergency_contact.phone_number).to eq(emergency_contact.phone_number)
      expect(updated_emergency_contact.user_id).to eq(emergency_contact.user_id)
    end

    it 'will return a data hash with a nil id if no contact is found' do
      new_emergency_contact_params = { name: "Mr. Brightside" }

      patch "/api/v1/users/#{@user.id}/emergency_contacts", params: new_emergency_contact_params

      expect(response.body).to eq('{"data":{"id":null,"type":"emergency_contact"}}')
    end

    it 'can update an existing emergency contact' do
      emergency_contact = create(:emergency_contact, user_id: @user.id)

      new_emergency_contact_params = { name: "" }

      patch "/api/v1/users/#{@user.id}/emergency_contacts/#{emergency_contact.id}", params: new_emergency_contact_params

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

    describe "As a developer, I can send a destroy request to the user emergency contacts endpoint" do
      it "and get back a 204 success response to indicate that the entry has been successfully destroyed." do
        emergency_contact = create(:emergency_contact, user_id: @user.id)

        delete api_v1_user_emergency_contact_path(emergency_contact.user_id, emergency_contact.id)

        expect(response).to be_successful
        expect(EmergencyContact.count).to eq(0)
        expect(response.status).to eq(204)
        expect(response.body).to eq("")
        expect{EmergencyContact.find(emergency_contact.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end


    it "can retrieve one emergency contact" do
      emergency_contact = create(:emergency_contact, user_id: @user.id)

      get "/api/v1/users/#{@user.id}/emergency_contacts/#{emergency_contact.id}"

      expect(response).to be_successful

      contact = JSON.parse(response.body, symbolize_names: true)

      expect(contact[:data]).to have_key(:id)
      expect(contact[:data][:id]).to eq(emergency_contact.id.to_s)

      expect(contact[:data][:attributes]).to have_key(:name)
      expect(contact[:data][:attributes][:name]).to be_a(String)

      expect(contact[:data][:attributes]).to have_key(:phone_number)
      expect(contact[:data][:attributes][:phone_number]).to be_a(String)

      expect(contact[:data][:attributes]).to have_key(:user_id)
      expect(contact[:data][:attributes][:user_id]).to be_an(Integer)
      expect(contact[:data][:attributes][:user_id]).to eq(@user.id)
    end

  end
end
