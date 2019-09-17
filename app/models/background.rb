class Background
  attr_reader :id

  def initialize(location)
    @location = location
    @id = 1
  end

  def photo_url
    unsplash_connection = Unsplash.new('denver')
    url = unsplash_connection.photo
  end
end
