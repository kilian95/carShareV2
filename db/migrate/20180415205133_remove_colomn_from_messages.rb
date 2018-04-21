class RemoveColomnFromMessages < ActiveRecord::Migration[5.1]
  def change
  	remove_column :messages, :other_user, :integer
  end
end
