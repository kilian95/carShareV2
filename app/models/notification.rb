class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :offer
	# enum type: [:booked, :cancelled, :messaged]

	# get notifications which are unread
	def self.unread
  	where(:read => false)
	end
end