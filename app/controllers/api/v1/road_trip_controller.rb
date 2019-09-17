class Api::V1::RoadTripController < ApplicationController

  def create
    rt = RoadTrip.new(search_params[:origin], search_params[:destination])
    redirect_to road_trip_path(rt)
   end

   def show
    render json: RoadTripSerializer.new(create)
   end

  private

  def search_params
   params.permit(:origin, :destination)
 end
end
