class Notification < ApplicationRecord
	belongs_to :user
	belongs_to :offer
	# enum type: [:booked, :cancelled, :messaged]
end
