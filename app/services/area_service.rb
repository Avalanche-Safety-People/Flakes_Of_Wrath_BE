require 'faraday'
require 'json'

class AreaService
 def self.conn
  Faraday.new('https://api.avalanche.org')
 end

 def self.areas
  response = conn.get('/v2/public/product?type=forecast&center_id=NWAC&zone_id=427')
  body = JSON.parse(response.body, symbolize_names: true)[:forecast_zone]
 end
end