class AddColoumnToChats < ActiveRecord::Migration[5.1]
  def change
  	add_column :chats, :other_user, :integer
  end
end
