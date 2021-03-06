class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
      flash[:notice] = "商品を追加しました。"
    else
      flash.now[:alert] = "全ての項目が必須入力です。"
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "変更が保存されました。"
      redirect_to admin_item_path
    else
    flash.now[:alert] = "全ての項目が必須入力です。"
    render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :image, :name, :introduction, :price, :is_active)
  end

end
