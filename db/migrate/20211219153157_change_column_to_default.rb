class ChangeColumnToDefault < ActiveRecord::Migration[5.2]
  def change
  change_column_default :customers, :is_deleted, from: true, to: false
  change_column_default :cart_items, :quantity, from: true, to: 1
  change_column_default :orders, :delivery_fee, from: true, to: 800
  change_column_default :orders, :order_status, from: true, to: 0
  change_column_default :order_lists, :making_status, from: true, to: 0
  end
end
