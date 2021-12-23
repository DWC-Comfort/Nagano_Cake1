class Admin::OrderListsController < ApplicationController

  def update
    # 注文商品のIDを取得
    @order_list = OrderList.find(params[:id])
    @order_list.update(order_list_params)

    # 注文商品のIDの中にある、注文IDを@orderに格納している。
    @order = @order_list.order

       # 制作ステータスを選択したデータを取得が左辺
       # order_listモデルのmaking_statusの値を取得している。
    if params[:order_list][:making_status] == "making"
       @order.update(order_status: 2)

          # 注文に紐づいた注文商品の個数の合計が、注文に紐づいた、値が3の制作ステータスの合計が一緒の時（3=制作完了）
    elsif @order.order_lists.count == @order.order_lists.where(making_status: 3).count
          @order.update(order_status: 3)
    end
    # 元のページにリダイレクトする
    redirect_back(fallback_location: root_path)
  end


  private

  def order_list_params
    params.require(:order_list).permit(:making_status)
  end

end
