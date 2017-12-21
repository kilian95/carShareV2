class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show
    @user = User.find(params[:id])
    # Get the sum of miles for all offers belonging to user
    @totalMiles = @user.offers.sum(:miles)
    @totalOffers = @user.offers.size
    @offers = @user.offers.limit(3).order("created_at DESC")

    @allOffers = Offer.all.order("created_at DESC") # maybe limit

    @bookedOffers = @user.offers.where.not(passenger_id: nil).order("created_at DESC") 

    @bookedLifts = @allOffers.where(passenger_id: @user.id).order("created_at DESC")
    @totalBooked = @bookedLifts.size
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end
end
