class Api::V1::EmergencyContactsController < ApplicationController
  def create
    emergency_contact = EmergencyContact.new(emergency_contact_params)
    if emergency_contact.save
      render json: EmergencyContactSerializer.new(emergency_contact), status: :created
    end
  end




  private

  def emergency_contact_params
    params.require(:emergency_contact).permit(:name, :phone_number, :user_id)
  end
end
