class AddExtraColomnToOffers < ActiveRecord::Migration[5.1]
  def change
  	add_column :offers, :return_booked, :boolean, default: false
  end
end
