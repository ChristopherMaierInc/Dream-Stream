class CartProductsController < ApplicationController
  def create
     @cart = current_cart
     @cart_product = @cart.cart_products.new(cart_product_params)
     existing_order = @cart.cart_products.where(product_id: params[:cart_product][:product_id])
     if existing_order.count >= 1
       existing_order.last.update_column(:qty, existing_order.last.qty + params[:cart_product][:qty].to_i)
     else
       @cart.save
     end
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
