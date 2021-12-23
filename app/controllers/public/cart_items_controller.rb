class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0  #合計金額算出用
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.quantity += params[:cart_item][:quantity].to_i
      #10個以上をカートに入れられないように設定　ここから
       if @cart_item.quantity > 10
         @item = Item.find(params[:cart_item][:item_id])
         redirect_to item_path(@item), notice: "You can order up to 10 pieces at one time."
       else
        @cart_item.save
        redirect_to cart_items_path, notice: "You have added cart_item successfully."
       end
      #10個以上をカートに入れられないように設定　ここまで
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
      @cart_item.save
      redirect_to cart_items_path, notice: "You have added cart_item successfully."
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: 'You have updated cart_item successfully.'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "You have deleted cart_item successfully."
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path, notice: "You have deleted cart_items successfully."
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
