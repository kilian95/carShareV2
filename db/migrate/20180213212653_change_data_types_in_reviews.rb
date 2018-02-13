class ChangeDataTypesInReviews < ActiveRecord::Migration[5.1]
  def change
  	remove_column :reviews, :communication
  	remove_column :reviews, :driving
  	remove_column :reviews, :comfort
  	remove_column :reviews, :punctual
  end
end
