require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :zone_id }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :description }
  end

  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'attributes' do
    before :each do
      @user_1 = User.create!(uid: '107509505203685220862', provider: 'google_oauth2', name: 'Gavin',
                             email: 'gavin@guhmail.com')
      @trip_1 = @user_1.trips.create!(name: 'Ski Trip', zone_id: 3, start_date: Date.new(2023, 0o3, 0o2),
                                      description: 'Going skiing!')
    end

    it 'instance of' do
      expect(@trip_1).to be_an_instance_of(Trip)
    end

    it 'should have the expected attributes' do
      expect(@trip_1.name).to eq('Ski Trip')
      expect(@trip_1.zone_id).to eq(3)
      expect(@trip_1.start_date).to eq(Date.new(2023, 0o3, 0o2))
      expect(@trip_1.description).to eq('Going skiing!')
    end
  end
end
