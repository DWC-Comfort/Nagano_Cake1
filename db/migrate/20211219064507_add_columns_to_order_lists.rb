class AddColumnsToOrderLists < ActiveRecord::Migration[5.2]
  def change
     add_column :order_lists, :order_id, :integer
     add_column :order_lists, :item_id, :integer
     add_column :order_lists, :quantity, :integer
     add_column :order_lists, :making_status, :integer
     add_column :order_lists, :total_price, :integer
  end
end
