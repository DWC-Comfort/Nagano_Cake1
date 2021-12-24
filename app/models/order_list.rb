class OrderList < ApplicationRecord

  belongs_to :order
  belongs_to :item


  enum making_status: {not_startable: 0, wating_for_make: 1, making: 2, completed: 3 }

end
