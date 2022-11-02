class AreaController < ApplicationController
 def areas
  response = Faraday.get('https://api.avalanche.org/v2/public/product?type=forecast&center_id=NWAC&zone_id=427')
  body = JSON.parse(response.body, symbolize_names: true)
 end
end