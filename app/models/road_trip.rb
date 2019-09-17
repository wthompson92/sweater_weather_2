class RoadTrip

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @id = 1
  end

  def google_directions_connection
    google_connection = GoogleDirections.new(@origin, @destination)
  end

  def google_geocode_conncection
    google_connection = GoogleDirections.new(@destination)
    google_connection.lat_and_long
  end

  def dark_sky_connection
    dark_sky_connection = DarkSky.new(google_geocode_conncection)
  end


  def arrival_time
    google_connection.get_duration[:value] + Time.now.to_i

  end

  def weather_at_arrival_time
    times = []
    dark_sky_connection.minutely.map do |data|
      times << data[:time]
    end
    nearest_weather_time = times.min_by{|x| (arrival_time-x).abs}
    dark_sky_connection.weather_at_time(nearest_weather_time)
  end
end
