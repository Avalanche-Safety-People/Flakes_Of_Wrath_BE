class Forecast
  # attr_reader

  def initialize(attributes)
    @max_temp = attributes[:temp][:max]
    @min_temp = attributes[:temp][:min]
    @description = attributes[:weather].first[:description]
    @avg_wind_speed = attributes[:wind_speed]
    @max_wind_speed = attributes[:wind_gust]
    @attributes = attributes ##optional stand in for any additional needed info
  end

  def snowfall
    if @attributes[:snow]
      @attributes[:snow]
    else
      0
    end
  end

  def rainfall
    if @attributes[:rain]
      @attributes[:rain]
    else
      0
    end
  end
end