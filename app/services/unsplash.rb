class Unsplash

  def initialize(location)
    @location = location
  end

  def search_photos
    get_json("/search/photos")
  end

  private
  def conn
    conn = Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV['UNSPLASH_KEY']
      faraday.params["query"] = "#{@location}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
