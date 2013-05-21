require 'test_helper'

class OrdersControllerTest < ActionController::TestCase

  def setup
  	 sign_in FactoryGirl.create(:user)
  end

  test 'place an order' do
  	assert_difference 'Order.count' do
	  	post :create, order: {
	  		product_id: FactoryGirl.create(:product, price: 1).id,
	  		address: 'Mon adresse'
	  	}
  	end

  	assert_response :redirect
  	assert_redirected_to order_path(assigns(:order))
  end

  test 'fail to place order' do
  	assert_no_difference 'Order.count' do
	  	post :create, order: {
	  		product_id: FactoryGirl.create(:product, price: 10000).id,
	  		address: 'Mon adresse'
	  	}
  	end

  	assert_match /Fonds insuffisants/, response.body

  	assert_response :success
  end
end
