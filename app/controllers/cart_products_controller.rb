class CartProductsController < ApplicationController
  def create
     @order = current_cart
     @cart_product = @cart.cart_products.new(cart_product_params)
     @order.save
     session[:cart_id] = @cart.id
   end

   def update
     @cart = current_cart
     @cart_product = @cart.cart_products.find(params[:id])
     @cart_products.update_attributes(cart_product_params)
     @cart_products = @cart.cart_products
   end

   def destroy
     @cart = current_cart
     @cart_product = @cart.cart_products.find(params[:id])
     @cart_product.destroy
     @cart_products = @cart.cart_products
   end

 private

   def cart_product_params
     params.require(:cart_product).permit(:qty, :product_id)
   end

end
