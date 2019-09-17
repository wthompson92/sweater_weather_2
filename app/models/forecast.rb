class Forecast
  attr_reader :id

  def initialize(location)
    @location = location
    @id = 1
  end

  def coords
    connection = GoogleGeocoding.new(@location)
    connection.lat_and_long
  end

  def dark_sky_connection
    DarkSky.new(coords)
  end

  def current_weather
    filter = dark_sky_connection.current_weather
    return_hash = {time: filter[:time], summary: filter[:summary], icon: filter[:icon], temperature: filter[:temperature], humidity: filter[:humidity], uv_index: filter[:uvIndex], visibility: filter[:visibility]}
  end

  def hourly
    filtered = dark_sky_connection.hourly[:data][0..7]
    return_array = Array.new
    n = 0
    filtered.each do |filter|
      n += 1
      return_hash = {hour: n, summary: filter[:summary], icon: filter[:icon], temperature: filter[:temperature], time: filter[:time]}
      return_array << return_hash
    end
    return_array
  end

  def daily
    filtered = dark_sky_connection.daily[:data][0..7]
    return_array = Array.new
    n = 0
    filtered.each do |filter|
      n += 1
      return_hash = {day: n, time: filter[:time], summary: filter[:summary], icon: filter[:icon], percip: filter[:precipProbability], high: filter[:temperatureHigh], low: filter[:temperatureLow]}
      return_array << return_hash
    end
    return_array
  end
end
