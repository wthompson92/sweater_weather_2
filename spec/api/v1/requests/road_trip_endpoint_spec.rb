require 'rails_helper'

describe 'Road Trip API Endpoint' do

  before :each do
   conn = Faraday.new
    @response = conn.post do |req|
      req.url "http://localhost:3000/api/v1/road_trip"
      req.headers['Content-Type'] = 'application/json'

      req.body = '{ "origin": "houston", "destination": "denver" }'
    end
  end

  it "Returns Status Success" do

    expect(@response.status).to eq(200)
  end


  it "JSON body response contains expected  attributes" do
     response_body = JSON.parse(@response.body)["data"]['attributes']["destination_weather_at_arrival_time"]
    expect(response_body.keys).to match_array(["apparentTemperature", "cloudCover", "dewPoint", "humidity", "icon", "ozone", "precipIntensity","precipProbability", "precipType", "pressure", "summary", "temperature", "time", "uvIndex", "visibility", "windBearing", "windGust", "windSpeed"])
  end
end
