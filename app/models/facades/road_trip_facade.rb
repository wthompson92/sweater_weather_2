class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def geocode_destination
    GoogleGeocodingGeocode.new(@destination)
  end

  def destination_weather
    Darksky.new(geocode_destination)
  end

  def find_destination_weather_at_arrival_time
    trip = RoadTrip.new(@origin, @destination)
    arrival_time = trip.arrival_time
    destination_weather.weather_by_time(arrival_time)
  end

end
