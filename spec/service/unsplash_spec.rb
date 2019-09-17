require 'rails_helper'

describe 'Unsplash Service' do

  before :each do
    unsplash_connection = Unsplash.new("denver")
    @parsed = unsplash_connection.photo
  end

  it "Can get a photo" do
  expect(@parsed).not_to be_empty
  end
end
