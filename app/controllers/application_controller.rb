class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      Cart.new
  end

end
