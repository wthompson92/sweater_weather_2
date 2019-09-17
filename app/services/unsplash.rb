class Unsplash

  def initialize(location)
    @location = location
  end

  def photo
    get_json[:results].first[:urls][:raw]
  end

  def conn
     @_conn ||= Faraday.new(url: "https://api.unsplash.com/search/photos") do |faraday|
       faraday.params["client_id"] = ENV['UNSPLASH_KEY']
       faraday.params["query"] = "#{@location}"
       faraday.adapter Faraday.default_adapter
     end
   end

   def get_json
       response = conn.get
       JSON.parse(response.body, symbolize_names: true)
   end
end
