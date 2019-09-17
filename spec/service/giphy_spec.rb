require 'rails_helper'

describe 'GiphyService' do

  before :each do
    giphy_connection = Giphy.new("Sunny")
    @parsed = giphy_connection.get_json[:data].first[:url]

  end

  it "Can get a URL" do
    expect(@parsed).not_to be_empty

  end
end
