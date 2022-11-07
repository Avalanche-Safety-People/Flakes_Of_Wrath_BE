class Api::V1::TripsController < ApplicationController
  def show
    trip = Trip.find(params[:id])
    render json: TripSerializer.new(trip)
  end

  def index
    trips = Trip.where(user_id: params[:user_id])

    render json: TripSerializer.new(trips)
  end

  def update
    user = User.find(params[:user_id])
    if user.trips.exists?
      trip = user.trips.find(params[:id])
      if trip.update(trip_params)
        render json: TripSerializer.new(trip)
      else
        render json: {error: 'trip unsuccessfully updated'}
      end
    else
      render json: TripSerializer.no_trip
    end
  end

  def create
    trip = Trip.new(trip_params)

    if trip.save
      render json: TripSerializer.new(trip), status: :created
    else
      render json: {error: 'trip unsuccessfully created'}
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
  end
  
private

  def trip_params
    params.fetch(:trip, {}).permit(:name, :zone_id, :start_date, :description, :user_id)
  end
end