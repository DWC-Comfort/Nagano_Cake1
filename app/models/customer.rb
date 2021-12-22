class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  has_many :receivers, dependent: :destroy
  
  has_many :orders, dependent: :destroy
  
  has_many :cart_items, dependent: :destroy

  def active_for_authentication?
    # is_deletedがfalseならtrueを返すようにしています。
    super && (self.is_deleted == false)
  end


end
