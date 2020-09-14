class AddTownIdToClinics < ActiveRecord::Migration[5.1]
  def change
  	remove_column :clinics, :townname, :string
  	add_column :clinics, :town_id, :integer
  end
end
