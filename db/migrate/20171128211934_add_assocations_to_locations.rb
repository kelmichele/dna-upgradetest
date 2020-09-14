class AddAssocationsToLocations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :locations, :city, :string
  	remove_column :locations, :state, :string
  	add_column :locations, :town_id, :integer
  end
end
