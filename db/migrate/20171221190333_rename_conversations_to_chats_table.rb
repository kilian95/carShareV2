class RenameConversationsToChatsTable < ActiveRecord::Migration[5.1]
  def change
  	rename_table :conversations, :chats
  end
end
