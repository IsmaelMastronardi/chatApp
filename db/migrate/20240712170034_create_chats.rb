class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
