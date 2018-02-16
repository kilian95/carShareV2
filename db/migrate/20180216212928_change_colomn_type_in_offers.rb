class ChangeColomnTypeInOffers < ActiveRecord::Migration[5.1]
  def change
  	change_column :offers, :return_pickup_time, :time
  end
end
