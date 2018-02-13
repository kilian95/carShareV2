class AddMoreFieldsToRatings < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :communication, :boolean
  	add_column :reviews, :comfort, :boolean
  	add_column :reviews, :driving, :boolean
  	add_column :reviews, :punctual, :boolean
  end
end
