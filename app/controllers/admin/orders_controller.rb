class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
    @order_list = OrderList.all
    # 注文商品(OrderList)モデルにカート内商品の情報をもとに保存。
    # @order = Order.new
    # @order = current_customer.orders.new(order_params)
    # @order.save
    #顧客に紐付いた、カート内商品をとってくる。
    # @cart_items = current_customer.cart_items.all
    # それをeach分で出していく。
      # @cart_items.each do |cart_item|
        # 空の箱を作成する
          # @order_lists = @order.order_items.new
          # @order_lists.item_id = cart_item.item.id
          # @order_lists.total_price = cart_item.item.price
          # @order_lists.quantity = cart_item.quantity
          # @order_lists.save
      # end
  end

  def show
    @order = Order.find(params[:id])
  end






end
