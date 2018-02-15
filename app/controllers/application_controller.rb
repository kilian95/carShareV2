class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

	before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
		# allow these added paramaters to be set during sign up
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :gender])
		# allow these added paramaters to be edited after sign up.
		devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, 
			:gender, :bio, :phone, :dob, :year, :make, :model, :avatar, :home_address, :work_address])
	end

	#redirect admins to admin homepage. Redirect users to user homepage.
	def after_sign_in_path_for(current_user)
    if admin_signed_in?
    	admins_root_path
    elsif user_signed_in?
    	root_path
    end		
	end

	#display notifications for current user
	def set_notifications
		@notifications = Notification.where(reciever_id: current_user).limit(5).order("created_at DESC")
	end
end
