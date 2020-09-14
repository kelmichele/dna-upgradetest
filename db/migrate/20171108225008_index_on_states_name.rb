class IndexOnStatesName < ActiveRecord::Migration[5.1]
  def change
  	add_index :states, :id
  	add_index :states, :name
  end
end
