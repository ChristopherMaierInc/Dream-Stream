class AddSubtotalToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :subtotal, :decimal, precision: 8, scale: 2
  end
end
