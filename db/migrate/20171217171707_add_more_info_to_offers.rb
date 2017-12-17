class AddMoreInfoToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :date, :datetime
  end
end
