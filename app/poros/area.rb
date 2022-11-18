class Area
 attr_reader :name,
             :url,
             :state,
             :id,
             :current_av_risk,
             :travel_advice,
             :end_date,
             :start_date

  def initialize(data)
    @name = data[:properties][:name]
    @url = data[:properties][:link]
    @state = data[:properties][:state]
    @current_av_risk = data[:properties][:danger_level]
    @id = data[:id]
    @travel_advice = data[:properties][:travel_advice]
    @start_date = data[:properties][:start_date]
    @end_date = data[:properties][:end_date]
  end

  def av_danger
    av_risk_forecast = [@current_av_risk]
    forecasts = ForecastFacade.daily_forecast(lat_long[0], lat_long[1])
    future_forecasts = forecasts[1..-1]
    future_forecasts.each do |forecast|
      current_risk = av_risk_forecast.last
      current_risk = 1 if current_risk == -1
      current_risk -= 1
      if forecast.avg_wind_speed > 50
        current_risk += 3
      elsif forecast.avg_wind_speed > 25 && forecast.avg_wind_speed <= 50
        current_risk += 2
      elsif forecast.avg_wind_speed > 15
        current_risk += 1
      end

      if forecast.snowfall > 18
        current_risk += 3
      elsif forecast.snowfall > 12
        current_risk += 2
      elsif forecast.snowfall >= 6
        current_risk += 1
      end

      if forecast.max_temp > 45
        current_risk += 2
      elsif forecast.max_temp > 34 && forecast.min_temp > 32
        current_risk += 1
      end

      if current_risk > 5
        current_risk = 5
      elsif current_risk < 1
        current_risk = 1
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
      422 => [46.78, -121.74],
      421 => [48.68, -121.11],
      419 => [47.98, -123.49],
      428 => [48.53, -120.65],
      429 => [47.35, -120.57],
      430 => [46.94, -121.08],
      431 => [45.31, -121.77]
    }
    coordinate_records[id]
  end
end
