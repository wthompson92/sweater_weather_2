require 'rails_helper'

describe 'DarkSkyService' do

  before :each do
    darksky_connection = DarkSky.new({:lat=>39.7392358, :lng=>-104.990251})
    @hourly = darksky_connection.hourly[:data]
    @daily = darksky_connection.daily[:data]
    @current_weather = darksky_connection.current_weather
  end

  it "Can get a current_weather forecast" do
    expect(@current_weather).not_to be_empty
  end

  it "Can get an hourly forecast" do
    expect(@hourly).not_to be_empty
  end

  it "Can get an daily forecast" do
    expect(@daily).not_to be_empty
  end
end
