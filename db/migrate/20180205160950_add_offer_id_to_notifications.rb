class AddOfferIdToNotifications < ActiveRecord::Migration[5.1]
  def change
  	add_column :notifications, :offer_id, :integer
  end
end
