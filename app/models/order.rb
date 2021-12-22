class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_lists, dependent: :destroy
  
  #支払方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  #注文ステータス
  enum order_status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }
  
end 