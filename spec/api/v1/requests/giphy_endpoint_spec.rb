require 'rails_helper'

describe 'Gifs#Show API Endpoint' do

  before :each do
    get "/api/v1/gifs?location=denver"
  end

  it "Returns Status Success" do
    expect(response).to have_http_status(200)
  end

  it "JSON body response contains expected  attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']['daily_gifs']
    expect(json_response.first.keys).to match_array(["time", "url", 'summary'])
    expect(json_response.count).to eq(8)
  end
end
