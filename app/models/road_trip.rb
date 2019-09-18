class RoadTrip
  
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @id = 1
  end

  def duration
    google_connection = GoogleDirections.new(@origin, @destination)
    dirs = google_connection.directions[:routes].first[:legs].first[:duration]
  end

  def arrival_time
    duration[:value] + Time.now.to_i
  end
end
