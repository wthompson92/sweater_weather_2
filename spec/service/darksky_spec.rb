require 'rails_helper'

describe 'DarkSkyService' do

  before :each do
    darksky_connection = DarkSky.new({:lat=>39.7392358, :lng=>-104.990251})
    @forecast = darksky_connection.forecast
  end

  it "Can get a get a forecast for a coordinates" do
    expect(@forecast).not_to be_empty
  end

end
