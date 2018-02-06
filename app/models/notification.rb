class Notification < ApplicationRecord
	belongs_to :user
	# enum type: [:booked, :cancelled, :messaged]
end
