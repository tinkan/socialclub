class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_orders

  def get_orders
  	@orders = Order.all
  end
end
