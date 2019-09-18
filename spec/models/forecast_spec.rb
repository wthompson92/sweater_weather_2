require 'rails_helper'
RSpec.describe "Forecast" do
  before :each do
    coords = ({:lat=>39.7392358, :lng=>-104.990251})
    darksky = DarkSky.new(coords)
    weather_data = darksky.forecast
    @forecast = Forecast.new(weather_data)
  end

  it "Can get current weather forecast" do
    expect(@forecast.current_weather.keys).to match_array([:time, :summary,:icon, :temperature, :humidity,:uvIndex,:visibility])
  end

  it "can return hourly weather attributes" do
    expect(@forecast.eight_hour_forecast.first.keys).to eq([:time, :summary, :icon])
    expect(@forecast.eight_hour_forecast.count).to eq(8)
  end

  it "can return daily weather" do
    expect(@forecast.eight_day_forecast.first.keys).to eq([:time, :summary, :icon, :precipProbability, :precipType, :temperatureHigh, :temperatureLow])
    expect(@forecast.eight_day_forecast.count).to eq(8)

  end
end
