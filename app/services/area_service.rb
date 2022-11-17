require 'faraday'
require 'json'

class AreaService
  def self.conn
    Faraday.new('https://api.avalanche.org')
  end

  def self.areas
    Rails.cache.fetch("nwac-#{Date.today}") do
      response = conn.get('v2/public/products/map-layer/NWAC')
      body = JSON.parse(response.body, symbolize_names: true)[:features]
    end
  end
end
