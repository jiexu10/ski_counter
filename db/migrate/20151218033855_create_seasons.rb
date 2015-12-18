class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :start_year, null: false
      t.string :end_year, null: false
      t.boolean :current, null: false, default: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
