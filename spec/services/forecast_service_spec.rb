require 'rails_helper'

RSpec.describe 'OpenWeather API' do
  describe 'Daily Forecast Endpoint' do
    it 'returns a forecast for daily weather' do
      days = ForecastService.daily_forecast[:daily]
      # require 'pry'; binding.pry

      expect(days).to be_a Array
      expect(days.count).to eq 8
      day_1 = days.first
      expect(day_1).to have_key(:temp)
      expect(day_1[:temp]).to be_an Hash
      expect(day_1[:temp]).to have_key(:max)
      expect(day_1[:temp][:max]).to be_a Float
      expect(day_1[:temp]).to have_key(:min)
      expect(day_1[:temp][:min]).to be_a Float
      expect(day_1).to have_key(:weather)
      expect(day_1[:weather].first).to have_key(:main)
      expect(day_1[:weather].first[:main]).to be_an String
    end
  end
end