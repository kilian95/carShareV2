class AddInfoToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :communication, :integer
  	add_column :reviews, :comfort, :integer
  	add_column :reviews, :punctual, :integer
  	add_column :reviews, :driving, :integer

  end
end
