class Receiver < ApplicationRecord
  belongs_to :customer
  
  #配送情報を全て表示するためのメソッド
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
