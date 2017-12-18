class AddDetourToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :detour, :string
  end
end
