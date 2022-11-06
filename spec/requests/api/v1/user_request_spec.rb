require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'has a route' do
    before :each do
      @user_1 = User.create!(uid: '107509505203685220862', provider: 'google_oauth2', name: 'Gavin',
                             email: 'gavin@guhmail.com')
    end

    # it "GET /api/v1/users" do
    #   user = File.read("spec/fixtures/user_example.json")

    # end
  end
end
