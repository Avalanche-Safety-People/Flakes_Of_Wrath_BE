class ForecastService
  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org/data/3.0/onecall') do |faraday|
      faraday.params['appid'] = ENV['OPENWEATHERTOKEN']
    end
  end

  def self.daily_forecast
    response = conn.get('?lat=47.427&lon=-121.418&exclude=minutely,hourly')
    JSON.parse(response.body, symbolize_names:true)
  end
end