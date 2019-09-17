require 'rails_helper'

RSpec.describe RoadTrip, type: :model do
  before :each do
    @road_trip = RoadTrip.new("houston", "denver")
  end

  it "Can get a faraday object" do
    expect(@road_trip.duration.keys).to match_array([:text,:value])

  end

  it "Can calculate arrival time" do
    expect(@road_trip.arrival_time.class). to eq(Integer)
  end
end
