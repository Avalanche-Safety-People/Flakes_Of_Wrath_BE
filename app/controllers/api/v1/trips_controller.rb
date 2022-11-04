class Api::V1::TripsController < ApplicationController
  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(trip)
  end

  def index
    trips = Trip.where(user_id: params[:user_id])
    # require 'pry';binding.pry
    render json: TripSerializer.new(trips)
  end
end