class AddPassengerIdToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :passenger_id, :integer
    add_index :offers, :passenger_id
  end
end
