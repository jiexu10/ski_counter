class UsersAddCurrentSeason < ActiveRecord::Migration
  def change
    add_reference :users, :current_season
  end
end
