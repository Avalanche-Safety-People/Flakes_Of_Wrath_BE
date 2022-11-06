class Api::V1::AreasController < ApplicationController
  def areas
    @areas = AreaFacade.area_details
  end

  def show
    @area = AreaFacade.single_area(params[:zone_id])
  end
end
