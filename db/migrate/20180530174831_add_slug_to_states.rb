class AddSlugToStates < ActiveRecord::Migration[5.1]
  def change
  	add_column :states, :slug, :string
  end
end
