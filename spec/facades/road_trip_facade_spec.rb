require 'rails_helper'

describe 'Road Trip Facade' do

  before :each do
    @rtf = RoadTripFacade.new('denver', 'boulder')
  end
  #
  # it "Returns Status Success" do
  #   expect(@rtf.get_miniute_weather).to eq(1)
  # end
  #
  # it "Returns Status Success" do
  #   expect(@rtf.get_duration).to eq(1)
  # end

  it "Returns Status Success" do
    expect(@rtf.arrival_time).to eq(1)
  end
end
