class CartsController < ApplicationController
  def show
    @cart_products = current_cart.cart_products
  end
end
