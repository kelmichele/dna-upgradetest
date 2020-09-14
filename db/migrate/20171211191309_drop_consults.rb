class DropConsults < ActiveRecord::Migration[5.1]
  def change
  	drop_table :consults
  end
end
