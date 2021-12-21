class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per()
  end
  
  def show
     @items = Item.all
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
  end

end
