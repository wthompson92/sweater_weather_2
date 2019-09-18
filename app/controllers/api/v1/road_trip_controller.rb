class Api::V1::RoadTripController < ApplicationController

  def new

    render json: RoadTripSerializer.new(RoadTripFacade.new(trip_params))
  end

private

  def trip_params
    params.permit(:origin, :destination)
  end
end
