class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  def show
    @user = User.find(params[:id])
    # Get the sum of miles for all offers belonging to user
    @totalMiles = @user.offers.sum(:miles)
    @totalOffers = @user.offers.size
    @offers = @user.offers.limit(3).order("created_at DESC")

    @bookedLifts = Offer.where(passenger_id: @user.id)
                        .where("date < ?", 1.days.ago)
                        .order("created_at DESC")

    #reviews-------------------------------------------------------------
    @reviews = Review.where(reviewee_id: @user.id).order("created_at DESC")
    @totalReviews = @reviews.count
    #get overall average rating and round to nearest 0.5 decimal
    @averageRating = @reviews.average(:rating)
    # if average rating exists/not null
    if @averageRating
        @ratingRounded = (@averageRating*2).ceil.to_f / 2
        @blankStars = 5 - @ratingRounded

        #get average rating for indivudal ratings
        @averageCommunication = @reviews.average(:communication)
        @communicationRounded = (@averageCommunication*2).ceil.to_f / 2

        @averageComfort = @reviews.average(:comfort)
        @comfortRounded = (@averageComfort*2).ceil.to_f / 2

        @averageDriving = @reviews.average(:driving)
        @drivingRounded = (@averageDriving*2).ceil.to_f / 2

        @averagePunctual = @reviews.average(:punctual)
        @punctualRounded = (@averagePunctual*2).ceil.to_f / 2
    end    

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
