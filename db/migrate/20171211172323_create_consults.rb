class CreateConsults < ActiveRecord::Migration[5.1]
  def change
    create_table :consults do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :consults, :author_id
    add_index :consults, :receiver_id
    add_index :consults, [:author_id, :receiver_id], unique: true
  end
end
