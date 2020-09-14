class DropClinics < ActiveRecord::Migration[5.1]
  def change
  	drop_table :clinics
  end
end
