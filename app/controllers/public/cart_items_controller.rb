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
         redirect_to item_path(@item), notice: "一度に10個まで注文できます"
       else
        @cart_item.save
        redirect_to cart_items_path, notice: "カート内に商品を追加しました"
       end
      #10個以上をカートに入れられないように設定　ここまで
    else
      @cart_item = current_customer.cart_items.new(cart_item_params)
        if  @cart_item.quantity == Integer
            @cart_item.save
            redirect_to cart_items_path, notice: "カート内に商品を追加しました"
        else
            redirect_back(fallback_location: root_path)
            flash[:alert] = "数量が未選択です"
        end
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice: '商品の数量を変更しました'
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: "商品をカート内から削除しました"
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path, notice: "全ての商品をカート内から削除しました"
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
