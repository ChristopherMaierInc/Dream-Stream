class ApplicationController < ActionController::Base
  before_action :authenticate_seller!
  protect_from_forgery with: :exception
end
