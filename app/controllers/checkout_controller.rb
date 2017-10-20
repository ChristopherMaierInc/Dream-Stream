class CheckoutController < ApplicationController
  def create
    # Amount in cents
    @price_in_dollars = current_cart.subtotal
    @price_in_cents = (@price_in_dollars * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @price_in_cents,
      :description => 'Rails Stripe customer',
      :currency    => 'AUD'
    )

    flash[:notice] = "Your purchase was successful. Your card was charged $#{@price_in_dollars}"

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/carts/show'
  end
end
