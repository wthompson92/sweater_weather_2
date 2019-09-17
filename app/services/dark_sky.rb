class DarkSky

  def initialize(coords)
    @lat = coords[:lat]
    @long = coords[:lng]
  end

  def forecast
    key =  ENV["DARK_SKY_KEY"]
    get_json("/forecast/#{key}/#{@lat},#{@long}")
  end

  def weather_at_time(time)
    key = ENV["DARK_SKY_KEY"]
    get_json("/forecast/#{key}/#{@lat},#{@long},#{time}")
  end

  private
  
    def conn
      conn = Faraday.new(url: "https://api.darksky.net") do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
