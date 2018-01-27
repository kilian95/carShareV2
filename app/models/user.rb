class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #retrieve users that were created x amount of days ago from current time and date.
  scope :last_x_days, -> (x) { where(created_at: x.days.ago..Time.zone.now) }       

	has_many :offers
	has_many :messages
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
end
