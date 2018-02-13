class ChangeAttributeNameInReviews2 < ActiveRecord::Migration[5.1]
  def change
  	rename_column :reviews, :reviewer_id, :reviewee_id
  end
end
