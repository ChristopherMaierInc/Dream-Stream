class Product < ApplicationRecord
  belongs_to :cart_items
  attachment :custom_image
end
