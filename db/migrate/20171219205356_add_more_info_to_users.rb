class AddMoreInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :birthYear, :integer
    add_column :users, :phone, :integer
  end
end
