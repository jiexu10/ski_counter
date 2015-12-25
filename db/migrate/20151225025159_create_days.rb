class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.string :location, null: false
      t.string :weather
      t.string :notes
      t.belongs_to :season, null: false

      t.timestamps null: false
    end
  end
end
