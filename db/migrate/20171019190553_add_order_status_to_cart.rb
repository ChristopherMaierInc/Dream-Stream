class AddOrderStatusToCart < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :order_status, foreign_key: true
  end
end
