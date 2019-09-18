require 'rails_helper'

describe 'Forecasts#Show API Endpoint' do

  before :each do
    get "/api/v1/forecast?location=denver"

  end
  it "Returns Status Success" do
    expect(response).to have_http_status(200)
    status = JSON.parse(response.body)["data"]
  end

  it "JSON body response contains expected  attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']

    expect(json_response.keys).to match_array(["current", "daily", "hourly", "id"])
  end

  it "Current Weather JSON attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']['current']

    expect(json_response.keys).to match_array(['time', 'summary','icon', 'temperature','humidity','uvIndex','visibility'])
  end

  it "Hourly Weather JSON attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']['hourly']

    expect(json_response.first.keys).to match_array(["icon", "summary", "time"])
  end

  it "Daily Weather JSON attributs" do
    json_response = JSON.parse(response.body)["data"]['attributes']['daily']

    expect(json_response.first.keys).to match_array(["icon", "precipProbability", "precipType", "summary", "temperatureHigh", "temperatureLow", "time"])
  end
end
