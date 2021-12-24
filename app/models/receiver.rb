class Receiver < ApplicationRecord
  belongs_to :customer
  
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  
  #配送情報を全て表示するためのメソッド
  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
end
