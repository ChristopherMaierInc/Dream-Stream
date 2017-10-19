class Product < ApplicationRecord
  has_many :cart_products

  default_scope { where(active: true) }
end
