class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    @total_price = 0  #合計金額算出用
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if Item.find_by(item: @cart_item.item)
      @cart_item.update(cart_item_params)
    else
      @cart_item.save
    end
        redirect_to cart_items_path, notice: "You have added cart_item successfully."
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
