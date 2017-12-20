class AddMilesToOffers < ActiveRecord::Migration[5.1]
  def change
    add_column :offers, :miles, :integer
  end
end
