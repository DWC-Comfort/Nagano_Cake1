class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    
    # 注文ステータスを選択したデータを取得が左辺
    # orderモデルのorder_statusの値を取得している。
    # 取得したデータが右辺の場合、その処理
    if params[:order][:order_status] == "paid_up"
      # 制作ステータスが自動で更新される（この記述は1＝”制作待ち”）
      @order.order_lists.update(making_status: 1)
    end
    redirect_back(fallback_location: root_path)


  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end


end
