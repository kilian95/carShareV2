class RemoveColomnFromchats < ActiveRecord::Migration[5.1]
  def change
  	remove_column :chats, :other_user, :integer
  end
end
