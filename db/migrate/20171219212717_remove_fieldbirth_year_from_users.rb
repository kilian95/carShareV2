class RemoveFieldbirthYearFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :birthYear, :integer
  end
end
