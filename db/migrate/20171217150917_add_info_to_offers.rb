class AddInfoToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :seats, :integer
    add_column :offers, :luggage, :string
    add_column :offers, :flexibility, :string
    add_column :offers, :food, :boolean, default: false
    add_column :offers, :smoking, :boolean, default: false
  end
end
