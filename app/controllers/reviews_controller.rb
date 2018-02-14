class ReviewsController < ApplicationController
	
	def new
		@user = current_user 
		@offer = Offer.find(params[:offer_id])
		# @reviewee = User.find(params[:user_id])
		@reviewee = @offer.user
    @review = @user.reviews.build
	end

	def create
		@user = current_user
		@offer = Offer.find(params[:offer_id])
		@reviewee = @offer.user
		# @reviewee = User.find(params[:user_id])
    @review = @user.reviews.build(review_params)
    if @review.save
    	redirect_to root_path, notice: "Sucesfully left a review"
    	@offer.update_attribute(:reviewed, true)
    else
			render 'new'	
		end
	end

	private

	def review_params
		params.require(:review).permit(:description, :rating, :comfort, :driving, :punctual, :communication, :reviewee_id, :user_id)
	end
end	
	
	