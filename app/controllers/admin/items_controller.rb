class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = "商品を追加しました"
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:genre_id, :image_id, :name, :introduction, :price, :is_active)
  end

end