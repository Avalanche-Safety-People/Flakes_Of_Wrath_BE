class ForecastFacade
  def self.daily_forecast(lat, long)
    json = ForecastService.daily_forecast

    @forecast_days = json[:results].map do |forecast_data|
      Forecast.new(forecast_data)
    end
  end
end
