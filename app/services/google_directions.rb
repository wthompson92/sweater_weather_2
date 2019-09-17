class GoogleDirections

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def directions
    get_json("directions/json?")
  end

  private

  def conn
    conn = Faraday.new(url: "https://maps.googleapis.com/maps/api") do |faraday|
      faraday.params["origin"] = @origin
      faraday.params["destination"] =@destination
      faraday.params["key"] = ENV['GOOGLE_DIRECTIONS_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
