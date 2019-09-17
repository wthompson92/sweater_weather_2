
class Forecast
  def initialize(coords)
    @lat = coords[:lat]
    @long = coords[:lng]
    @coords = coords
  end

  def forecast
    dark_sky_connection = DarkSky.new(@coords)
    dark_sky_connection.forecast
  end

  def current_weather
    forecast[:currently]
  end

  def minutely_weather
    forecast[:minutely][:data]
  end

  def hourly_weather
    forecast[:hourly][:data]
  end



  #
  # def arrival_time
  #    get_duration + Time.now.to_i
  #   times = []
  #   get_miniute_weather.map do |data|
  #     times << data[:time]
  #   end
  #   nearest_weather_time = times.min_by{|x| (arrival_time-x).abs}
  #     darksky_connection = DarkSky.new(get_coords)
  #     darksky_connection.weather_at_time(nearest_weather_time)
  #     binding.pry
 end
