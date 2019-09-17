class GoogleGeocoding

  def initialize(city)
    @city = city
  end

  def conn
    conn = Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json?') do |faraday|
      faraday.params["key"] = ENV["GOOGLE_KEY"]
      faraday.params["address"] = "#{@city}"
    faraday.adapter Faraday.default_adapter
    end
  end

  def get_json
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  def lat_and_long
    get_json[:results].first[:geometry][:location]
  end
end
