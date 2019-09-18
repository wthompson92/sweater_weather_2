class Giphy
  def initialize(summary)
    @summary = summary
  end

  def gifs
    get_json("/v1/gifs/search")
  end

  def photo_url
    gifs[:data].first[:url]
  end

  private
  def conn
    conn = Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.params["api_key"] = ENV["GIPHY_KEY"]
      faraday.params["q"] = "#{@summary}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
