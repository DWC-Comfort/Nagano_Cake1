class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
    @allitems = Item.all.count
  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
