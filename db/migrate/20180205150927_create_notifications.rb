class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :type
      t.integer :sender_id
      t.integer :reciever_id
      t.integer :chat_id

      t.timestamps
    end
  end
end
