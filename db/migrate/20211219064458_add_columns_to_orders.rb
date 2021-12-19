class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :payment_method, :integer
    add_column :orders, :delivery_fee, :integer
    add_column :orders, :total_item_price, :integer
    add_column :orders, :receiver_name, :string
    add_column :orders, :receiver_postal_code, :string
    add_column :orders, :receiver_address, :string
    add_column :orders, :order_status, :integer
  end
end
