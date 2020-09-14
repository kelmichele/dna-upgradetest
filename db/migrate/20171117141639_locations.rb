class Locations < ActiveRecord::Migration[5.1]
  def change
	  create_table :locations do |t|
	  	t.string :street
	  	t.string :city
	    t.string :zip
	    t.string :state
	    t.string :abrv
		  t.timestamps
		end

  	add_index :locations, :city
  	add_index :locations, :zip
  	add_index :locations, :state
  	add_index :locations, :abrv
  end
end
