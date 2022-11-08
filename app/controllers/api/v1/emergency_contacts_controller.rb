class Api::V1::EmergencyContactsController < ApplicationController
  def create
    emergency_contact = EmergencyContact.new(emergency_contact_params)
    if emergency_contact.save
      render json: EmergencyContactSerializer.new(emergency_contact), status: :created
    end
  end

  def index
    render json: EmergencyContactSerializer.new(EmergencyContact.all)
  end

  def show
    render json: EmergencyContactSerializer.new(EmergencyContact.find_by(id: params[:id], user_id: params[:user_id]))
  end

  def update
    user = User.find(params[:user_id])
    if user.emergency_contacts.exists?
      @emergency_contact = user.emergency_contacts.find(params[:id])
      if @emergency_contact.update(emergency_contact_params)
        render json: EmergencyContactSerializer.new(@emergency_contact)
      else
        render json: {error: 'contact unsuccessfully updated'}, status: 404
      end
    else
      render json: EmergencyContactSerializer.no_contact
    end
  end

  def destroy
    emergency_contact = EmergencyContact.find(params[:id])
    emergency_contact.destroy
  end

  private

  def emergency_contact_params
    params.permit(:name, :phone_number, :user_id)
  end
end
