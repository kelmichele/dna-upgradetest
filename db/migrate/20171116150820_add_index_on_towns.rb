class AddIndexOnTowns < ActiveRecord::Migration[5.1]
  def change
  	add_index :towns, :townname
  	add_index :towns, :id

  	add_timestamps :clinics, null: true
  end
end
