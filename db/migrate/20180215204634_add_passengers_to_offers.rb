class AddPassengersToOffers < ActiveRecord::Migration[5.1]
  def change
  	add_column :offers, :passengers_id, :string, array: true, default: []
  end
end
