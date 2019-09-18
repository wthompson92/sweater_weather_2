class RoadTripFacade
  attr_reader :id

  def initialize(trip)
    @origin = trip[:origin]
    @destination = trip[:destination]
    @id = 1
  end

  def geocode_destination
    connection = GoogleGeocoding.new(@destination)
    connection.location_coordinates
  end

  def destination_weather
    DarkSky.new(geocode_destination)
  end

  def destination_weather_at_arrival_time
    trip = RoadTrip.new(@origin, @destination)
    arrival_time = trip.arrival_time
    arrival_weather = destination_weather.weather_by_time(arrival_time)
    arrival_weather[:currently]
  end
end
