class Admins::OffersController < ApplicationController
  before_action :find_offer, only: [:show]

  def index
  	@search = Offer.search(params[:q])
		@offers = @search.result.order("created_at DESC")
  end

  def find_offer
		@offer = Offer.find(params[:id])
  end
  
end