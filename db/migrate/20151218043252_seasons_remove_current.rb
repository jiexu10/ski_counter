class SeasonsRemoveCurrent < ActiveRecord::Migration
  def change
    remove_column :seasons, :current, :boolean
  end
end
