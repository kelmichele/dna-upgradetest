class AddTownIDtoLocations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :locations, :townname, :string
  	add_column :locations, :town_id, :integer
  end
end
