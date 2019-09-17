class GoogleGeocoding

  def initialize(city)
    @city = city
  end

  def location_coordinates
    path = get_json("geocode/json?")
    path[:results].first[:geometry][:location]
  end

private
  def conn
    conn = Faraday.new(url: 'https://maps.googleapis.com/maps/api/') do |faraday|
      faraday.params["key"] = ENV["GOOGLE_KEY"]
      faraday.params["address"] = "#{@city}"
    faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
