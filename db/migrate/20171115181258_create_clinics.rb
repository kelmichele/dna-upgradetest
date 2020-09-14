class CreateClinics < ActiveRecord::Migration[5.1]
  def change
    create_table :clinics do |t|
    	t.string :address
    	t.string :zipcode
    end
  end
end
