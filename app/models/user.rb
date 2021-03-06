class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #retrieve users that were created x amount of days ago from current time and date.
  scope :last_x_days, -> (x) { where(created_at: x.days.ago..Time.zone.now) }       

	has_many :offers
  has_many :reviews
	has_many :messages
  has_many :notifications
  has_many :subscriptions
  has_many :chats, through: :subscriptions

	mount_uploader :avatar, AvatarUploader #For image upload

	def existing_chats_users
    existing_chat_users = []
    self.chats.each do |chat|
      existing_chat_users.concat(chat.subscriptions.where.not(user_id: self.id).map {|subscription| subscription.user})
    end
    existing_chat_users.uniq
  end

  #subtract 5 from rating to get amount of blank stars.
  def blank_stars(rating)
    5 - rating
  end
end
