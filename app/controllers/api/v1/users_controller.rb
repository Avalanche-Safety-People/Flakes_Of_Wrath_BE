class Api::V1::UsersController < ApplicationController
 def index
  require "pry"; binding.pry
  @user = render json: UserSerializer.new(User.find_by(uid: params[:uid]))
  require "pry"; binding.pry
 end
end
