class Api::V1::BackgroundsController < ApplicationController

  def index
    render json: BackgroundSerializer.new(Background.new(search_params[:location]))
  end

  private

  def search_params
    params.permit(:location)
  end
end
