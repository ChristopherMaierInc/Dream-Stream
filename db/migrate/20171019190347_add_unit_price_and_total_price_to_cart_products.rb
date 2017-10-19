class AddUnitPriceAndTotalPriceToCartProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :cart_products, :unit_price, :decimal, precision: 8, scale: 2
    add_column :cart_products, :total_price, :decimal, precision: 8, scale: 2
  end
end
