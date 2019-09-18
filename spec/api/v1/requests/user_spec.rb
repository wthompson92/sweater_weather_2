require 'rails_helper'

describe 'Road Trip API Endpoint' do

  before :each do

    post '/api/v1/user', params: { email: "wnt925", password: "123", password_confirmation: "123" }

  end

  it "Returns Status Success" do
    expect(response.status).to eq(201)
  end


  it "JSON body response contains expected  attributes" do
      parsed = JSON.parse(response.body)
    expect(parsed.keys).to match_array(["api_key"])
  end
end
