class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :destination_weather_at_arrival_time
end
