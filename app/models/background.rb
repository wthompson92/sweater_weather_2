class Background
  attr_reader :id

  def initialize(location)
    @location = location
  end

  def photo_url
    unsplash_connection = Unsplash.new(@location)
    url = unsplash_connection.photo
  end
end
