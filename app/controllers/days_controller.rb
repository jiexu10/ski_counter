class DaysController < ApplicationController
  def show
    @day = Day.find(params[:id])
    @season = @day.season
  end
end
