class Api::V1::AreasController < ApplicationController
  def index
    @areas = AreaFacade.area_details
    if @areas
      render json: AreaSerializer.new(@areas)
    else
      render json: AreaSerializer.no_area
    end
  end

  def show
    @area = AreaFacade.single_area(params[:id])
    if @area
      render json: AreaSerializer.new(@area)
    else
      render json: AreaSerializer.no_area_array
    end
  end
end