class Admins::DashboardController < ApplicationController
  
  def index
    @totalLifts =  Offer.count
  end
end