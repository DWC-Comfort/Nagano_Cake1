class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :customer
  
  #税込み価格用
  def add_tax_price
   (price * 1.1).floor
  end
  
  #小計算出用
  def subtotal
    item.add_tax_price * quantity
  end
  
end
