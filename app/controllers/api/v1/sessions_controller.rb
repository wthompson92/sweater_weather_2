class SessionsController < ApplicationController

  def create
    user = User.find_by(user_name: params[:user_name])
    session[:user_id] = user.id
  end
end
