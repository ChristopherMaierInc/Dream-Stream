class ProductsController < ApplicationController
  def index
    @products = Product.all
    @cart_products = current_cart.cart_products.new
  end
end
