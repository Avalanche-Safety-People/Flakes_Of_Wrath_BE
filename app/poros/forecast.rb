class Forecast
  # attr_reader

  def initialize(attributes)
    @max_temp = attributes[:temp][:max]
    @min_temp = attributes[:temp][:min]
    @description = attributes[:weather].first[:description]
    @attributes = attributes ##optional stand in for any additional needed info
  end

  def snowfall
    if @attributes[:snow]
      (@attributes[:snow]/25.4).round(2)
    else
      0
    end
  end

  def rainfall
    if @attributes[:rain]
      (@attributes[:rain]/25.4).round(2)
    else
      0
    end
  end
end