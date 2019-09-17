class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:ema])
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    render :json :
  end
end
end
