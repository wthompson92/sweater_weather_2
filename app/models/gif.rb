class Gif
  attr_reader :id

  def initialize(location)
    @location = location
  end

  def coords
    connection = GoogleGeocoding.new(@location)
    connection.lat_and_long
  end

  def summary
    dark_sky_connection = DarkSky.new(coords)
    summary = []
    dark_sky_connection.daily[:data].each do  |day|
      summary << day[:summary]
    end
    summary
  end

  def times
    dark_sky_connection = DarkSky.new(coords)
    days = []
    dark_sky_connection.daily[:data].each do |day|
      days << day[:time]
    end
    days
  end


  def images
    array = Array.new
    summary.each do |summary|
      times.each do  |time|
        giphy_connection = Giphy.new(summary)
        parse = giphy_connection.get_json[:data]
        array << {summary: "#{summary}", time: time,  url: parse.first[:url]}
      end
    end
    array[0..4]
  end
end
