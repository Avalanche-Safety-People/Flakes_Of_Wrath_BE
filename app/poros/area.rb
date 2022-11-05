class Area
 attr_reader :name,
             :url,
             :state,
             :zone_id,
             :current_av_risk,
             :travel_advice,
             :forecast_date

 def initialize(data)
  @name = data[:properties][:name]
  @url = data[:properties][:link]
  @state = data[:properties][:state]
  @current_av_risk = data[:properties][:danger_level]
  @zone_id = data[:id]
  @travel_advice = data[:properties][:travel_advice]
  @forecast_date = data[:properties][:end_date]
 end

  def av_danger
    av_risk_forecast = [@current_av_risk]
    forecasts = ForecastFacade.daily_forecast(lat_long[0], lat_long[1])
    future_forecasts = forecasts[1..-1]
    future_forecasts.each do |forecast|
      current_risk = av_risk_forecast.last
      if forecast.wind_speed > 50
        current_risk += 2
      elsif forecast.wind_speed > 25
        current_risk += 1
      end

      if forecast.snowfall > 10
        current_risk += 2
      elsif forecast.snowfall > 4
        current_risk += 1
      end

      if forecast.max_temp > 45
        current_risk += 2
      elsif forecast.max_temp > 34
        current_risk += 1
      elsif forecast.max_temp < 30
        current_risk -= 1
      end

      av_risk_forecast << current_risk
    end
    av_risk_forecast
  end

  def lat_long
    coordinate_records = {
      423 => [47.75, -121.09],
      427 => [47.43, -121.42],
      420 => [46.18, -121.93],
      422 => [46.61, -121.66],
      421 => [48.68, -121.11],
      419 => [47.98, -123.49],
      428 => [48.53, -120.65],
      429 => [47.35, -120.57],
      430 => [46.94, -121.08],
      431 => [45.31, -121.77]
    }
    coordinate_records[self.zone_id]
  end
end