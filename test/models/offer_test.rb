require File.expand_path("../../test_helper", __FILE__)

class OfferTest < ActiveSupport::TestCase
  test 'valid offer' do
  	offer = Offer.new(pickup: 'belfast', dropoff: 'lisburn', 
  		description: 'test', user_id: 4, seats: 1, luggage: 'small', flexibility: "none",
  		detour: "none", food: t, smoking: t, price: 4.00, miles: 10)
    assert user.valid?
  end

  test 'invalid without address' do
  end

  test 'invalid without price' do
  end
end
