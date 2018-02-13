class AddReviewedToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :reviewed, :boolean
  end
end
