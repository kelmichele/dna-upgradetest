class AddSlugToTowns < ActiveRecord::Migration[5.1]
  def change
  	add_column :towns, :slug, :string
  end
end
