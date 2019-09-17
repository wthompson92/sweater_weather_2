class RoadTrip < ApplicationRecord
  validates_presence_of :origin, :destination
end
