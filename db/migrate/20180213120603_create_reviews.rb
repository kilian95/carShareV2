class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :reviewee_id
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
