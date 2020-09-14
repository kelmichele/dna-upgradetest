class AddGuestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :guest, :boolean
  end
end
