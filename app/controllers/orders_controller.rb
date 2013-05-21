class OrdersController < ApplicationController
    before_filter :authenticate_user!
  # GET /orders
  # GET /orders.json
  #def index
  #  @orders = Order.find(:all, :order => 'date ASC')
#
   #respond_to do |format|
  #   format.html # index.html.erb
	#format.json { render json: @orders }
# end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.where('seller = ? OR user_id = ?', current_user.id, current_user.id).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new	
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
 # def edit
 #   @order = Order.find(params[:id])
#  end

  # POST /orders
  # POST /orders.json
  def create 

   @order =  current_user.orders.new(params[:order])
   

   
   if current_user.sold >= @order.product.price
     respond_to do |format|
      
       @order.save
       current_user.sold -= @order.product.price
       current_user.save
       @order.product.user.sold += @order.product.price
       @order.product.user.save
       @order.seller = @order.product.user_id
       @order.save

       format.html { redirect_to @order, notice: 'Votre achat a ete effectue avec succes' }
       format.json { render json: @order, status: :created, location: @order }
       
     end
   end 
   if current_user.sold < @order.product.price
     respond_to do |format|
      format.html { redirect_to @order.product, notice: "Fonds insuffisants." }
      format.json { render json: @order.errors, status: :unprocessable_entity}
    end
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Vous devez entrer une adresse valide" }
      format.json { render json: @order.errors, status: :unprocessable_entity}
    end

  end

end

  # PUT /orders/1
  # PUT /orders/1.json
 # def update
 #   @order = Order.find(params[:id])

  #  respond_to do |format|
  #    if @order.update_attributes(params[:order])
  #      format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #      format.json { head :no_content }
  #    else
   #     format.html { render action: "edit" }
   #     format.json { render json: @order.errors, status: :unprocessable_entity }
  #    end
  #  end
#  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  #def destroy
 #   @order = Order.find(params[:id])
 #   @order.destroy

 #   respond_to do |format|
 #     format.html { redirect_to orders_url }
 #     format.json { head :no_content }
 #   end
#  end
end
