class AddTotalToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :total, :decimal, precision: 8, scale: 2
  end
end
