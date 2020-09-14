class AddTownsToLocations < ActiveRecord::Migration[5.1]
  def change
  	add_column :locations, :townname, :string
  end
end
