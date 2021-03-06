class DaysController < ApplicationController
  include CommonSki

  def show
    @day = Day.find(params[:id])
    @season = @day.season
  end

  def new
    @day = Day.new
  end

  def create
    @season = Season.find(params[:season_id])
    @day = Day.new(day_params)
    @day.season = @season

    if @day.save
      redirect_to day_path(@day), notice: 'Day added successfully'
    else
      flash.now[:error] = "#{@day.errors.full_messages}"
      render :new
    end
  end

  private
  def day_params
    params.require(:day).permit(:end_year)
  end
end
