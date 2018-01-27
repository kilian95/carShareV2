class Admins::OffersController < ApplicationController
  before_action :find_offer, only: [:show]

  def index
  	@search = Offer.search(params[:q])
		@offers = @search.result.order("created_at DESC").page(params[:page]).per(20) #display 20 per page
  end

  def find_offer
		@offer = Offer.find(params[:id])
  end
  
end