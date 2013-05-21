# encoding: UTF-8
class OrdersController < ApplicationController
    before_filter :authenticate_user!

  def show
    @order = Order.where('seller = ? OR user_id = ?', current_user.id, current_user.id).find(params[:id])
  end

  def new
    @order = Order.new	
  end

  def create 
   @order =  current_user.orders.new(params[:order])
   
    if @order.save
      redirect_to @order, notice: 'Votre achat a ete effectue avec succès' 
    else  
     render action: :new  
    end   
  end
end
