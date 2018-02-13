class ChangeAttributeNameInReviews < ActiveRecord::Migration[5.1]
  def change
  	rename_column :reviews, :reviewee_id, :reviewer_id
  end
end
