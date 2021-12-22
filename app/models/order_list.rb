class OrderList < ApplicationRecord

  enum order_status: {not_startable: 0, wating_for_make: 1, making: 2, completed: 3 }
end
