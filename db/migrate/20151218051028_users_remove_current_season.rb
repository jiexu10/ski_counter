class UsersRemoveCurrentSeason < ActiveRecord::Migration
  def change
    remove_reference :users, :current_season
  end
end
