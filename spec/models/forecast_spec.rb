require 'rails_helper'
RSpec.describe "Forecast" do
  before :each do
    coords = ({:lat=>39.7392358, :lng=>-104.990251})
    @forecast = Forecast.new(coords)
  end

  it "Can get forecast" do
    expect(@forecast.forecast.keys).to match_array([:currently, :daily, :flags, :hourly, :latitude, :longitude, :minutely, :offset, :timezone])
  end

  it "can return current weather attributes" do
    expect(@forecast.current_weather.keys).to match_array([:apparentTemperature, :cloudCover, :dewPoint, :humidity, :icon, :nearestStormBearing,:nearestStormDistance, :ozone, :precipIntensity, :precipProbability, :pressure, :summary, :temperature, :time, :uvIndex, :visibility, :windBearing, :windGust, :windSpeed])
  end

  it "can return minutely weather attributes" do
    expect(@forecast.minutely_weather.first.keys).to eq([:time, :precipIntensity, :precipProbability])
  end
  #
  it "can return hourly weather attributes" do
    expect(@forecast.hourly_weather.first.keys).to eq([:time, :summary, :icon, :precipIntensity, :precipProbability, :precipType, :temperature,:apparentTemperature, :dewPoint, :humidity, :pressure, :windSpeed, :windGust, :windBearing, :cloudCover, :uvIndex, :visibility, :ozone])
  end

  # it "can return daily weather" do
  #   expect(@forecast.hourly_weather).to eq(1)
  # end
end
