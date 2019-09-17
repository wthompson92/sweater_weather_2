class Api::V1::GifsController < ApplicationController

  def index
    render json: GifSerializer.new(Gif.new(search_params[:location]))
  end

  private

  def search_params
    params.permit(:location)
  end
