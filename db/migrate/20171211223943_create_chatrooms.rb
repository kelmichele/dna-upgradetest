class CreateChatrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :chatrooms do |t|
      t.integer :recipient_id
      t.integer :sender_id

      t.timestamps
    end
    add_index :chatrooms, :recipient_id
    add_index :chatrooms, :sender_id
		add_index :chatrooms, [:recipient_id, :sender_id], unique: true
  end
end
