class Offer < ApplicationRecord
	belongs_to :user
	validates :pickup, :dropoff, :date, :seats, :smoking, :food, :price, :presence => true

	#retrieve offers that were created x amount of days ago from current time and date.
  scope :last_x_days, -> (x) { where(created_at: x.days.ago..Time.zone.now) } 
end
