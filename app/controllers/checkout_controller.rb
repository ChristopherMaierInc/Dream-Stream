class CheckoutController < ApplicationController
  def create
    @order = "#{current_cart.id} created at #{current_cart.created_at}"
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

      :description => current_cart.cart_products
      :currency    => 'AUD'
    )

    flash[:notice] = "Your purchase was successful. Your card was charged $#{@price_in_dollars}"

    notification = "Customer [#{charge.customer}] with email #{customer.email} just purchased #{charge.description} for $#{@price_in_dollars} #{charge.currency}"

    PurchaseMailer.mail_purchase_notification(customer.email, notnotification).deliver_now

    confirmation = "Your order #{@order} was successfully made and your card was charged for $#{@price_in_dollars}. The order status is currently: #{current_cart.order_statuses.id}. Please contact us on our website if you experience any issues."

    PurchaseMailer.mail_purchase_confirmation(customer_email, confirmation).deliver_now

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/carts/show'
  end
end
