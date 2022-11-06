class Api::V1::EmergencyContactsController < ApplicationController
  def create
    emergency_contact = EmergencyContact.new(emergency_contact_params)
    render json: EmergencyContactSerializer.new(emergency_contact), status: :created if emergency_contact.save
  end

  def index; end

  def update
    user = User.find(params[:user_id])
    if user.emergency_contacts != []
      emergency_contact = user.emergency_contacts.find_by(params[:name])
      if emergency_contact.update(emergency_contact_params)
        render json: EmergencyContactSerializer.new(emergency_contact)
      else
        render json: { error: 'contact unsuccessfully updated' }, status: 404
      end
    else
      render json: EmergencyContactSerializer.no_contact
    end
  end

  private

  def emergency_contact_params
    params.require(:emergency_contact).permit(:name, :phone_number, :user_id)
  end
end
