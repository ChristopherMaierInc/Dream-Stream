class AddShippingToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :shipping, :decimal, precision: 8, scale: 2
  end
end
