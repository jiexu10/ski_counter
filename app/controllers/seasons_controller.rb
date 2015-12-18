class SeasonsController < ApplicationController
  def index
    # @user = User.find(session[:uid])
    @user = User.first
    # @current_season = @user.current_season
    @seasons = @user.seasons.order(start_year: :desc)
    @current_season = @seasons.first
    @seasons = @seasons - [@current_season]
  end
end
