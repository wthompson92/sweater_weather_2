require 'rails_helper'

describe 'GiphyService' do

  before :each do
    giphy_connection = Giphy.new("Sunny")
    @gifs = giphy_connection.gifs
    @photo_url = giphy_connection.photo_url
  end

  it "Can get a connection" do
    expect(@gifs).not_to be_empty
  end

  it "Can get a connection" do
    expect(@photo_url).not_to be_empty
  end
end
