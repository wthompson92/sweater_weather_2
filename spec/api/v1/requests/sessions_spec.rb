require 'rails_helper'

describe 'Sessions API Endpoint' do

  before :each do
    user = User.create(email: 'wnt', password: "123", password_confirmation: "123")
    post '/api/v1/sessions', params: { email: "wnt",  password: "123" }
  end

  it "Returns Status Success" do
    expect(response.status).to eq(200)
  end


  it "JSON body response contains expected  attributes" do
      parsed = JSON.parse(response.body)
    expect(parsed.keys).to match_array(["api_key"])
  end
end
