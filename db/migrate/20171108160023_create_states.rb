class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
    	t.string :name
    	t.string :abv
    	t.timestamps
    end
  end
end
