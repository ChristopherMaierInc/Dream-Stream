class PurchaseMailer < ApplicationMailer
  def mail_purchase_notification(customer_email, message)
    @customer_email = customer_email
    @message = message
    shop_email = 'filip.maslovaric@gmail.com'
    mail(to: shop_email, subject: "Customer @ #{@customer_email} just made a purchase!")
  end

  def mail_purchase_confirmation(customer_email, message)
    @customer_email = customer_email
    @message = message
    mail(to: @customer_email, subject: "Your order was successful!")
  end
end
