class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :weather_at_arrival_time
end
