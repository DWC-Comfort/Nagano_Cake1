class AddColumnsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :CartItems, :customer_id, :integer
    add_column :CartItems, :item_id, :integer
    add_column :CartItems, :quantity, :integer
  end
end
