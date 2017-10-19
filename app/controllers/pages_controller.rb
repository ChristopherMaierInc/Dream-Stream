class PagesController < ApplicationController
  def home
    @products = Product.all
  end

  def cart
  end

  def checkout
  end

  def purchase
    @cart = CartItems.all
    # Amount in cents
    @total = 0
    @cart.each do |cart|
      @total = @total + (cart.product.price * cart.qty)
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @total,
      :description => 'Rails Stripe customer',
      :currency    => 'AUD',
      :billingAddressLine1 => params[:stripeBillingAddressLine1]
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to checkout_pages_path
  end

end
