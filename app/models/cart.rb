class Cart < ApplicationRecord
  has_many :cart_products
  before_save :update_total

  def total
    cart_products.collect { |cp| cp.valid? ? (cp.qty * cp.price) : 0 }.sum
  end

private

  def update_total
    self[:total] = total
  end

end
