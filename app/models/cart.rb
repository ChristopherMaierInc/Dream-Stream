class Cart < ApplicationRecord
  has_many :cart_products
  before_save :update_total

  def subtotal
    cart_products.collect { |cp| cp.valid? ? (cp.qty * cp.unit_price) : 0 }.sum
  end

private

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
