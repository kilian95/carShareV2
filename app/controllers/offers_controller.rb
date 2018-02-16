class OffersController < ApplicationController
	before_action :find_offer, only: [:show, :edit, :update, :destroy]

	def index
		@offers = Offer.limit(5).order("created_at DESC")
		@search = Offer.search(params[:q])
	end

	def search
		@search = Offer.search(params[:q])
		@offerResults = @search.result.where("date > ?", 1.days.ago).order("created_at DESC")
	end

	def show
		#check if the date of the lift has already passed
		if @offer.date < Date.today
			@isValid = false
		else
			@isValid = true
		end	
	end

	def new
		@offer = current_user.offers.build
	end

	def create
		@offer = current_user.offers.build(offer_params)
		if @offer.save
			redirect_to @offer, notice: "sucesfully created new offer"
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
			if @offer.user == current_user
				redirect_to @offer, notice: "Offer was sucesfuly updated"
			else 
				#check if user has booked lift or cancelled lift
				if (@offer.passenger_id == nil)
					redirect_to @offer, notice: "Lift succesfully cancelled"
					Notification.create(notification_type: 2, user_id: current_user.id, reciever_id: @offer.user.id, offer_id: @offer.id)
				elsif (@offer.passenger_id != nil)
					redirect_to @offer, notice: "Lift succesfully booked"
					Notification.create(notification_type: 1, user_id: current_user.id, reciever_id: @offer.user.id, offer_id: @offer.id)			
				end
			end		
		else
			render 'edit'	
		end	
	end

	private

	def offer_params
		params.require(:offer).permit(:pickup, :dropoff, :description, :luggage,
		:smoking, :flexibility, :seats, :food, :date, :price, :detour, :miles, :passenger_id, :reviewed,
		:return_trip, :return_pickup_time, :return_booked, :passengers_id => [])
	end

	# finds correct offer
	def find_offer
		@offer = Offer.find(params[:id])
	end
end
