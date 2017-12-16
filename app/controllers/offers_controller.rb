class OffersController < ApplicationController
	before_action :find_offer, only: [:show, :edit, :update, :destroy]

	def index
		@offers = Offer.all.order("created_at DESC")
	end

	def show

	end

	def new
		@offer = current_user.offers.build
	end

	def create
		@offer = current_user.offers.build(offer_params)

		if @offer.save
			redirect_to @offer, notice: "suucesfully created new offer"
		else
			render 'new'
		end		
	end

	def destroy
		@offer.destroy
		redirect_to root_path
	end

	def edit
	end

	def update
		if @offer.update(offer_params)
			redirect_to @offer, notice: "Offer was sucesfuly updated"
		else
			render 'edit'	
		end	
	end

	private

	def offer_params
		params.require(:offer).permit(:pickup, :dropoff, :description)
	end

	# finds correct offer
	def find_offer
		@offer = Offer.find(params[:id])
	end
end
