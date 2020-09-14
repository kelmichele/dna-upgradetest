class DropTownOnLocations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :locations, :town_id, :integer
  end
end
