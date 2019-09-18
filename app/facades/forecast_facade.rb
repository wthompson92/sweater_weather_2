class ForecastFacade
  attr_reader :id

  def initialize(location)
    @location = location
  end

  def geocode_destination
    connection = GoogleGeocoding.new(@location)
    connection.location_coordinates
  end

  def location_weather
    dark_sky_connection = DarkSky.new(geocode_destination)
    Forecast.new(dark_sky_connection.forecast)
  end

  def current
    location_weather.current_weather
  end

  def hourly
    location_weather.eight_hour_forecast
  end

  def daily
    location_weather.eight_day_forecast
  end

end
