require 'rails_helper'

RSpec.describe 'Forecast Facade', :vcr do
  it 'it creates an array of forecast objects' do
    forecasts = ForecastFacade.daily_forecast(47.98, -123.49)

    expect(forecasts).to be_an Array
    expect(forecasts.count).to eq(8)

    forecasts.each do |forecast|
    end
  end
end
