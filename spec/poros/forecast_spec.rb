require 'rails_helper'

RSpec.describe 'Forecast POROS' do
  it 'returns a simplified weather forecast for the area', :vcr do
    @forecast = ForecastFacade.daily_forecast(47.427, -121.418)
  end
end
