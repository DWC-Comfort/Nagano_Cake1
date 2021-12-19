class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :Orders, :customer_id, :integer
    add_column :Orders, :payment_method, :integer
    add_column :Orders, :delivery_fee, :integer
    add_column :Orders, :total_item_price, :integer
    add_column :Orders, :receiver_name, :string
    add_column :Orders, :receiver_postal_code, :string
    add_column :Orders, :receiver_address, :string
    add_column :Orders, :order_status, :integer
  end
end
