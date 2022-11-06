class ForecastService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/3.0/onecall') do |faraday|
      faraday.params['appid'] = ENV['OPENWEATHERTOKEN']
    end
  end

  def self.daily_forecast(lat, long)
    response = conn.get("?lat=#{lat}&lon=#{long}&exclude=minutely,hourly&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end
