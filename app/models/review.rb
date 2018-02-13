class Review < ApplicationRecord
	belongs_to :user
	validates :rating, :description, :reviewee_id, :presence => true
end
