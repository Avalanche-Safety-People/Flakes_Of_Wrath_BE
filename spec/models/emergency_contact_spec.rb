require 'rails_helper'

RSpec.describe EmergencyContact, type: :model do
 describe 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :phone_number }
 end

 describe 'relationships' do
  # it { should belong_to :user }
 end

 describe 'attributes' do
  before :each do
   @contact_1 = EmergencyContact.create!(name: 'Kaelin', phone_number: '303-555-5555')
  end

  it 'instance of' do
   expect(@contact_1).to be_an_instance_of(EmergencyContact)
  end

  it 'should have the expected attributes' do
   expect(@contact_1.name).to eq('Kaelin')
   expect(@contact_1.phone_number).to eq('303-555-5555')
  end
 end
end