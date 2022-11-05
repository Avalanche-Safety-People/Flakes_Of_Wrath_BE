class Api::V1::AreasController < ApplicationController
 def areas
  @areas = AreaFacade.area_details
 end
end