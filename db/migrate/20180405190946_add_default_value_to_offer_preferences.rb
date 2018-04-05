class AddDefaultValueToOfferPreferences < ActiveRecord::Migration[5.1]
  def up
  	change_column :offers, :smoking, :boolean, default: false
  	change_column :offers, :food, :boolean, default: false
	end

	def down
  	change_column :offers, :smoking, :boolean, default: nil
  	change_column :offers, :food, :boolean, default: nil
	end
end
