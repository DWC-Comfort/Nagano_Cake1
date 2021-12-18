class AddColumnsToReceivers < ActiveRecord::Migration[5.2]
  def change
    add_column :receivers, :customer_id, :integer
    add_column :receivers, :name, :string
    add_column :receivers, :postal_code, :string
    add_column :receivers, :address, :string
  end
end
