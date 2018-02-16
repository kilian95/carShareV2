class AddReturnToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :return_trip, :boolean
    add_column :offers, :return_pickup_time, :datetime
  end
end
