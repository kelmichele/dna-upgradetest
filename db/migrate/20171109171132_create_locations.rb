class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
    	t.string :street
    	t.string :city
    	t.string :zip
    	t.string :statename
    	t.string :abv
    	t.timestamps
    end

    add_index :locations, :statename
    add_index :locations, :city
  end
end
