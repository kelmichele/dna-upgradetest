class AddAddr2ToLocations < ActiveRecord::Migration[5.1]
  def change
  	add_column :locations, :addr2, :string
  end
end
