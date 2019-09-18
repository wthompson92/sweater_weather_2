require 'rails_helper'

describe 'Background API Endpoint' do

  before :each do
    get "/api/v1/backgrounds?location=denver"

  end
  it "Returns Status Success" do
    expect(response).to have_http_status(200)
    status = JSON.parse(response.body)["data"]
  end

  it "JSON body response contains expected  attributes" do
    json_response = JSON.parse(response.body)["data"]['attributes']

    expect(json_response.keys).to match_array(["id", "photo_url"])
  end

end
