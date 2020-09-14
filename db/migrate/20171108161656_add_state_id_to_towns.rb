class AddStateIdToTowns < ActiveRecord::Migration[5.1]
  def change
  	add_column :towns, :state_id, :integer
  end
end
