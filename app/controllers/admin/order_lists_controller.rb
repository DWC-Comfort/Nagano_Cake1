class Admin::OrderListsController < ApplicationController

  def update
    @order_list = OrderList.find(params[:id])
    @order_list.update(order_list_params)
    # 元のページにリダイレクトする
    redirect_back(fallback_location: root_path)
  end


  private

  def order_list_params
    params.require(:order_list).permit(:making_status)
  end

end
