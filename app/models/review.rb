class Review < ApplicationRecord
	belongs_to :user
	validates :rating, :description, :comfort, :communication, :driving, :punctual, :reviewee_id, :presence => true
end
