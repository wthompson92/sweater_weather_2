class Api::V1::RoadTripController < ApplicationController

  def create
     RoadTrip.create!(road_trip_params)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
