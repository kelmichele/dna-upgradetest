class RemoveAbrvFromLocations < ActiveRecord::Migration[5.1]
  def change
  	remove_column :locations, :abrv, :string
  	add_column :locations, :latitude, :float
  	add_column :locations, :longitude, :float
  end
end
