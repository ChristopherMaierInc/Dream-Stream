class Cart < ApplicationRecord
  belongs_to :order_status
  has_many :cart_products

  before_validation :set_order_status, on: :create
  before_save :update_subtotal

  def subtotal
    cart_products.collect { |cp| cp.valid? ? (cp.qty * cp.unit_price) : 0 }.sum
  end

private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
