class Offer < ApplicationRecord
	belongs_to :user
	validates :pickup, :dropoff, :date, :seats, :smoking, :food, :price, :presence => true
end
