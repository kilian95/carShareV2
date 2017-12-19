class AddCarInformationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :make, :string
    add_column :users, :model, :string
    add_column :users, :year, :date
  end
end
