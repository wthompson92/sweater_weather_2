require 'rails_helper'

describe 'GoogleGeocodingService' do

  before :each do
    google_connection = GoogleGeocoding.new("denver")
    @parsed = google_connection.lat_and_long
  end

  it "Can get a Lat & Lonf" do
    expect(@parsed).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end
end
