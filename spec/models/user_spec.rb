require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it { should validate_presence_of :uid }
    it { should validate_presence_of :provider }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
   end
  
   describe 'relationships' do
    it { should have_many :trips }
    it { should have_many :emergency_contacts }
   end
end
