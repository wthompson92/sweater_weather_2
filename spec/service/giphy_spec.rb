require 'rails_helper'

describe 'GiphyService' do

  before :each do
    giphy_connection = Giphy.new("Sunny")
    @gifs = giphy_connection.gifs

  end

  it "Can get a connection" do
    expect(@gifs).not_to be_empty
    binding.pry

  end
end
