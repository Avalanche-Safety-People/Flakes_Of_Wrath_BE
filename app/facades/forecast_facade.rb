class ForecastFacade
  def self.daily_forecast(lat, long)
    days = ForecastService.daily_forecast(lat, long)[:daily]
    @forecast_days = days.map do |forecast_data|
      Forecast.new(forecast_data)
    end
  end
end
