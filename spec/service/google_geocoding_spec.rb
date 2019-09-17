require 'rails_helper'

describe 'GoogleGeocodingService' do

  before :each do
    google_connection = GoogleGeocoding.new("denver")
    @coordinates = google_connection.location_coordinates
  end
  it "It can geocode a city" do
    expect(@coordinates).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end
end
