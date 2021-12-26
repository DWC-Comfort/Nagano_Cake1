class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :cart_items, :customer_id, false
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :quantity, false
    
    change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :last_name_kana, false
    change_column_null :customers, :first_name_kana, false
    change_column_null :customers, :postal_code, false
    change_column_null :customers, :address, false
    change_column_null :customers, :phone_number, false
    change_column_null :customers, :is_deleted, false
    
    change_column_null :genres, :name, false
    
    change_column_null :items, :genre_id, false
    change_column_null :items, :name, false
    change_column_null :items, :image_id, false
    change_column_null :items, :introduction, false
    change_column_null :items, :price, false
    change_column_null :items, :is_active, false
    
    change_column_null :order_lists, :order_id, false
    change_column_null :order_lists, :item_id, false
    change_column_null :order_lists, :quantity, false
    change_column_null :order_lists, :making_status, false
    change_column_null :order_lists, :total_price, false
    
    change_column_null :orders, :customer_id, false
    change_column_null :orders, :payment_method, false
    change_column_null :orders, :delivery_fee, false
    change_column_null :orders, :total_item_price, false
    change_column_null :orders, :receiver_name, false
    change_column_null :orders, :receiver_postal_code, false
    change_column_null :orders, :receiver_address, false
    change_column_null :orders, :order_status, false
    
    change_column_null :receivers, :customer_id, false
    change_column_null :receivers, :name, false
    change_column_null :receivers, :postal_code, false
    change_column_null :receivers, :address, false
  end

  def down
    change_column_null :cart_items, :customer_id, true
    change_column_null :cart_items, :item_id, true
    change_column_null :cart_items, :quantity, true
    
    change_column_null :customers, :last_name, true
    change_column_null :customers, :first_name, true
    change_column_null :customers, :last_name_kana, true
    change_column_null :customers, :first_name_kana, true
    change_column_null :customers, :postal_code, true
    change_column_null :customers, :address, true
    change_column_null :customers, :phone_number, true
    change_column_null :customers, :is_deleted, true
    
    change_column_null :genres, :name, true
    
    change_column_null :items, :genre_id, true
    change_column_null :items, :name, true
    change_column_null :items, :image_id, true
    change_column_null :items, :introduction, true
    change_column_null :items, :price, true
    change_column_null :items, :is_active, true
    
    change_column_null :order_lists, :order_id, true
    change_column_null :order_lists, :item_id, true
    change_column_null :order_lists, :quantity, true
    change_column_null :order_lists, :making_status, true
    change_column_null :order_lists, :total_price, true
    
    change_column_null :orders, :customer_id, true
    change_column_null :orders, :payment_method, true
    change_column_null :orders, :delivery_fee, true
    change_column_null :orders, :total_item_price, true
    change_column_null :orders, :receiver_name, true
    change_column_null :orders, :receiver_postal_code, true
    change_column_null :orders, :receiver_address, true
    change_column_null :orders, :order_status, true
    
    change_column_null :receivers, :customer_id, true
    change_column_null :receivers, :name, true
    change_column_null :receivers, :postal_code, true
    change_column_null :receivers, :address, true
  end
end
