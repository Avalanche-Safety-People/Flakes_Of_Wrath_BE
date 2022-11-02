require 'rails_helper'

RSpec.describe Area, type: :model do
 describe 'validations' do
  it { should validate_presence_of :name }
  it { should validate_presence_of :url }
  it { should validate_presence_of :state }
  it { should validate_presence_of :zone_id }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
 end

 describe 'relationships' do
  # it { should have_many :predictions }
 end

 describe 'attributes' do
  before :each do
   @area_1 = Area.create!(name: 'Noah Pass', url: "http://www.dagreatestpass.com", state: "CO", zone_id: 7, latitude: 41.40338, longitude: 2.17403)
  end

  it 'instance of' do
   expect(@area_1).to be_an_instance_of(Area)
  end

  it 'should have the expected attributes' do
   expect(@area_1.name).to eq('Noah Pass')
   expect(@area_1.url).to eq('http://www.dagreatestpass.com')
   expect(@area_1.state).to eq('CO')
   expect(@area_1.zone_id).to eq(7)
   expect(@area_1.latitude).to eq(41.40338)
   expect(@area_1.longitude).to eq(2.17403)
  end
 end
end