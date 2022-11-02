require 'rails_helper'

RSpec.describe Trip, type: :model do
 describe 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :trip_zone }
  it { should validate_presence_of :dates }
  it { should validate_presence_of :description }
 end

 describe 'relationships' do
  # it { should belong_to :user }
 end

 describe 'attributes' do
  before :each do
   @trip_1 = Trip.create!(name: 'Ski Trip', trip_zone: 'Noah Pass', dates: '12/20/2022 - 12/23/2022', description: 'Going skiing!')
  end

  it 'instance of' do
   expect(@trip_1).to be_an_instance_of(Trip)
  end

  it 'should have the expected attributes' do
   expect(@trip_1.name).to eq('Ski Trip')
   expect(@trip_1.trip_zone).to eq('Noah Pass')
   expect(@trip_1.dates).to eq('12/20/2022 - 12/23/2022')
   expect(@trip_1.description).to eq('Going skiing!')
  end
 end
end