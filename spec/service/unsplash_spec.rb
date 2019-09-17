require 'rails_helper'

describe 'Unsplash Service' do

  before :each do
    unsplash_connection = Unsplash.new("denver")
    @photos = unsplash_connection.search_photos
  end

  it "Can search_photos" do
    expect(@photos).not_to be_empty
  end
end
