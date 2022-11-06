class Api::V1::UsersController < ApplicationController
  def index
    oauth_data = JSON.parse(request.body.read, symbolize_names: true)
    @user_create = User.find_or_create_by(uid: oauth_data[:uid],
                                  provider: oauth_data[:provider],
                                  name: oauth_data[:info][:name],
                                  email: oauth_data[:info][:email])
    @user = render json: UserSerializer.new(@user_create)
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def update
    user = User.find(params[:id])
    user.assign_attributes(favorite_zone: params[:favorite_zone])
    if user.save
      render json: UserSerializer.new(user)
    else
      render status: 404
    end
  end
end
