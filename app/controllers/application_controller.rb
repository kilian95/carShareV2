class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	def configure_permitted_parameters
		# allow these added paramaters to be set during sign up
		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :gender])
		# allow these added paramaters to be edited after sign up.
		devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :gender, :bio, :phone, :dob, :year, :make, :model])
	end

end
