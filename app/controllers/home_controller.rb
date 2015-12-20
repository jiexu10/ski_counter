class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(params[:user_id])
    end
  end
end
