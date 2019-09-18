class GifFacade
  attr_reader :id

  def initialize(location)
    @location = location
  end

  def geocode_destination
    connection = GoogleGeocoding.new(@location)
    connection.location_coordinates
  end

  def daily_weather
    dark_sky_connection = DarkSky.new(geocode_destination)
    forecast = Forecast.new(dark_sky_connection.forecast)
    forecast.eight_day_forecast
  end

  def gif_for_summary(summary)
    connection = Giphy.new(summary)
    connection.photo_url
  end

  def daily_gifs
    daily_weather.map do |weather_for_day|
      hash = {time: weather_for_day[:time], summary: weather_for_day[:summary], url: gif_for_summary(weather_for_day[:summary])}
    end
  end
end
