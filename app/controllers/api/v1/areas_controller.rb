class Api::V1::AreasController < ApplicationController
  def index
    @areas = AreaFacade.area_details
    render json: AreaSerializer.new(@areas)
  end

  def show
    @area = AreaFacade.single_area(params[:id])
    render json: AreaSerializer.new(@area)
  end
end