class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    #カートの内容を取得
    @cart_items = current_customer.cart_items.all
    #商品の小計
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
   
     #選択された支払方法を取得
    @order.payment_method = params[:order][:payment_method]
    
     #select_addressが0だった場合(自身の住所)
    if params[:order][:select_address] == "0" 
      @order.receiver_postal_code = current_customer.postal_code
      @order.receiver_address = current_customer.address
      @order.receiver_name = current_customer.last_name + current_customer.first_name
      
      #select_addressが1だった場合(登録済みの住所)
    elsif params[:order][:select_address] == "1"
      @receiver = Receiver.find(params[:order][:receiver_id])
      @order.receiver_postal_code = @receiver.postal_code
      @order.receiver_address = @receiver.address
      @order.receiver_name = @receiver.name
      
      #select_addressが2だった場合(新規登録の住所)
    elsif params[:order][:select_address] == "2"
      @order.receiver_postal_code = params[:order][:receiver_postal_code]
      @order.receiver_address = params[:order][:receiver_address]
      @order.receiver_name = params[:order][:receiver_name]
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    
    redirect_to orders_about_path
  end
  
  def about
  end
  
  def index
    @orders = Order.all
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end
  
  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method, :receiver_postal_code, :receiver_address, :receiver_name, :total_item_price)
  end

end
