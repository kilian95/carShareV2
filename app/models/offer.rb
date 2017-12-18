class Offer < ApplicationRecord
	belongs_to :user
	validates :pickup, :dropoff, :date, :seats, :smoking, :food, :presence => true
end
