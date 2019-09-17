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

    expect(json_response.keys).to match_array(["id", "current_weather", "hourly", "daily"])
  end

  it "Current Weather JSON attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']['current_weather']

    expect(json_response.keys).to match_array(["humidity", "icon", "summary", "temperature", "time", "uv_index", "visibility"])
  end

  it "Hourly Weather JSON attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']['hourly']

    expect(json_response.first.keys).to match_array( ["hour", "icon", "summary", "temperature", "time"])
  end

  it "Daily Weather JSON attributs" do
    json_response = JSON.parse(response.body)["data"]['attributes']['daily']

    expect(json_response.first.keys).to match_array( ["day", "high", "icon", "low", "percip", "summary", "time"])
  end
end
