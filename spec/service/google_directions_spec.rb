require 'rails_helper'

describe 'GoogleDirectionsService' do

  before :each do
    google_connection = GoogleDirections.new("denver", "santa_fe")
    @directions = google_connection.directions
  end

  it "Can get a Lat & Long" do
    expect(@directions).not_to be_empty
  end
end
