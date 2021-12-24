class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_lists, dependent: :destroy
  
  validates :payment_method, presence: true
  validates :receiver_name, presence: true
  validates :receiver_postal_code, presence: true
  validates :receiver_address, presence: true
  
  #支払方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  #注文ステータス
  enum order_status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }
  
def add_tax_price
　(price * 1.1).floor
end
  
def subtotal
    item.add_tax_price * quantity
end
  
end 