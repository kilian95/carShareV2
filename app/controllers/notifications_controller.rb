class NotificationsController < ApplicationController

	def link_through
	  @notification = Notification.find(params[:id])
	  @notification.update read: true
	  if @notification.notification_type == 1 
	  	redirect_to offer_path @notification.offer
	  elsif @notification.notification_type == 2
	  	redirect_to offer_path @notification.offer
	  elsif @notification.notification_type == 3
	  	redirect_to user_chats_path(current_user)
	  elsif @notification.notification_type == 4
	  	redirect_to user_path(current_user)
	  end		  
	end
end
