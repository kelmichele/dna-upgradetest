class CreateTown < ActiveRecord::Migration[5.1]
  def change
    create_table :towns do |t|
    	t.string :townname
    	t.timestamps
    end
  end
end
