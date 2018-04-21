class AddColoumnToMessages < ActiveRecord::Migration[5.1]
  def change
  	add_column :messages, :other_user, :integer
  end
end
