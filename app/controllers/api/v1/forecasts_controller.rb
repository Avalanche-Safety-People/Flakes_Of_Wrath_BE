class Api::V1::ForecastsController < ApplicationController
  def index
    @area = AreaFacade.single_area(params[:area_id])
    @forecasts = ForecastFacade.daily_forecast(@area.lat_long[0], @area.lat_long[1])
    render json: ForecastSerializer.new(@forecasts)
  end
end