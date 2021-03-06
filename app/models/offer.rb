class Offer < ApplicationRecord
	belongs_to :user
	has_many :notifications
	validates :pickup, :dropoff, :date, :seats, :price, :presence => true
	#retrieve offers that were created x amount of days ago from current time and date.
  scope :last_x_days, -> (x) { where(created_at: x.days.ago..Time.zone.now) }
end
