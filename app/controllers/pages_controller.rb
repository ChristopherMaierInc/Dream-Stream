class PagesController < ApplicationController
  before_action :set_cart

  def home
    @products = Product.all
  end

  def cart
    # @cart.products.push
  end

  def checkout
    # @cart.products.each do |cart|
    #
    # end
  end

  def purchase
    # Amount in cents
    @total = 0
    @cart.each do |checkout|
      @total = @total + (checkout.product.price * checkout.qty)
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @total,
      :description => 'Rails Stripe customer',
      :currency    => 'AUD'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to checkout_pages_path
  end

  private

  def set_cart
    if session.has_key? :cart_id
      # find the cart
      @cart = Cart.find(session[:cart_id])
    else
      # make a new cart
      @cart = Cart.new
      @cart.save
      session[:cart_id] = @cart.id

    end
  end

end
