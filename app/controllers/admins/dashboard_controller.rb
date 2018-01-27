class Admins::DashboardController < ApplicationController
  
  def index
    @totalOffers =  Offer.count 
    @totalLifts = Offer.where.not('passenger_id' => nil).count #where passenger has booked lift
    @monthLifts = Offer.where.not('passenger_id' => nil).where(created_at: 28.days.ago..DateTime.now).count
    @dayLifts = Offer.where.not('passenger_id' => nil).where(created_at: 1.days.ago..DateTime.now).count
  end
end