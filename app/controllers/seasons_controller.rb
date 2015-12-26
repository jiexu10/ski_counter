class SeasonsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if session[:user_id]
      @user_match = user_match?(@user)
    end
    @seasons = @user.seasons.order(start_year: :desc)
    @current_season = @seasons.first
    @seasons = @seasons - [@current_season]
  end

  def show
    @season = Season.find(params[:id])
    @user = User.find(params[:user_id])
    if session[:user_id]
      @user_match = user_match?(@user)
    end
    @days = @season.days
  end

  def new
    @user = User.find(params[:user_id])
    @season = Season.new
  end

  def create
    @user = User.find(params[:user_id])
    params["season"][:end_year] = "#{params["season"][:start_year].to_i + 1}"
    @season = Season.new(season_params)
    @season.user = @user

    if @season.save
      redirect_to user_seasons_path(@user), notice: 'Season added successfully'
    else
      flash.now[:error] = "#{@season.errors.full_messages}"
      render :new
    end
  end

  private
  def season_params
    params.require(:season).permit(:start_year, :end_year)
  end

  def user_match?(user)
    user == User.find(session[:user_id])
  end
end
