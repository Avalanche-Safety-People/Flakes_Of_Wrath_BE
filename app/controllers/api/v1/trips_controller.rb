class Api::V1::TripsController < ApplicationController
  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(trip)
  end

  def index
    trips = Trip.where(user_id: params[:user_id])

    render json: TripSerializer.new(trips)
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      render json: TripSerializer.new(trip)
    else
      render status: 404
    end
  end

  private

  def trip_params
    params.permit(:name, :zone_id, :start_date, :description, :user_id)
  end
end
