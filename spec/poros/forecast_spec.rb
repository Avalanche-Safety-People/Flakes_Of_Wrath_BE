require 'rails_helper'

RSpec.describe 'Forecast POROS' do
  it 'returns a simplified weather forecast for the area', :vcr do
    # @zone = ZoneExample.new
    @forecast = ForecastFacade.daily_forecast(47.427, -121.418)
    require 'pry'; binding.pry
  end
end
