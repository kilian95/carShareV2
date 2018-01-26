class Admins::UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
		@search = User.search(params[:q])
		@users = @search.result
	end

	def find_user
		@user = User.find(params[:id])
	end

	
end