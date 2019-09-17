class Api::V1::ForecastsController < ApplicationController

  def show
    render json: ForecastSerializer.new(Forecast.new(search_params[:location]))
  end

  private

  def search_params
    params.permit(:location)
  end
end
