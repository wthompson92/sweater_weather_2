require 'rails_helper'

describe 'Road Trip Facade' do

  before :each do
    @rtf = RoadTripFacade.new({origin: 'houston', destination: 'denver'})
  end

  it "Can Geocode destination for Coords" do
    expect(@rtf.geocode_destination).to eq({:lat=>39.7392358, :lng=>-104.990251})
  end

  it "Connects to Darksky" do
    expect(@rtf.destination_weather).to be_an_instance_of(DarkSky)
  end

  it "Returns weather for the destination at arrival time" do
    expect(@rtf.destination_weather_at_arrival_time.keys).to match_array([:time, :summary, :icon, :precipIntensity, :precipProbability, :precipType, :temperature,:apparentTemperature, :dewPoint, :humidity, :pressure, :windSpeed, :windGust, :windBearing, :cloudCover, :uvIndex, :visibility, :ozone])
  end
end
