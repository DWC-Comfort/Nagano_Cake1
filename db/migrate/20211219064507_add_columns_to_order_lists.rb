class AddColumnsToOrderLists < ActiveRecord::Migration[5.2]
  def change
     add_column :OrderLists, :order_id, :integer
     add_column :OrderLists, :item_id, :integer
     add_column :OrderLists, :quantity, :integer
     add_column :OrderLists, :making_status, :integer
     add_column :OrderLists, :total_price, :integer
  end
end
