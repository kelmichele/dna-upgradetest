class AddTownnameToClinics < ActiveRecord::Migration[5.1]
  def change
  	add_column :clinics, :townname, :string
  end
end
