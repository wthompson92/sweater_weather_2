require 'rails_helper'

describe 'Road Trip API Endpoint' do

  before :each do
    user =  User.create(email: 'wnt', password: "123", password_confirmation: "123", api_key: "fa4b86f9bede0690f34c")
    post '/api/v1/road_trip', params: { origin: "houston", destination: "denver", api_key: "fa4b86f9bede0690f34c" }

  end

  it "Returns Status Success" do
    expect(response.status).to eq(200)
  end


  it "JSON body response contains expected  attributes" do
      parsed = JSON.parse(response.body)["data"]["attributes"]["destination_weather_at_arrival_time"]
    expect(parsed.keys).to match_array(["apparentTemperature", "cloudCover", "dewPoint", "humidity", "icon", "ozone", "precipIntensity","precipProbability", "precipType", "pressure", "summary", "temperature", "time", "uvIndex", "visibility", "windBearing", "windGust", "windSpeed"])
  end
end
