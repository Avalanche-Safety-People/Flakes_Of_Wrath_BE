class Api::V1::AreasController < ApplicationController
 def areas
  @areas = AreaFacade.area_details
 end

 def show
  @areas = AreaFacade.area_details
  @area = Area.find(params[:zone_id])
 end
end