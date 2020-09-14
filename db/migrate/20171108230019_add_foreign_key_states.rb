class AddForeignKeyStates < ActiveRecord::Migration[5.1]
  def change
  	add_index :states, :abv
  end
end
