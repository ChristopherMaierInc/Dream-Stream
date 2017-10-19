class OrderStatus < ApplicationRecord
  has_many :carts
end
