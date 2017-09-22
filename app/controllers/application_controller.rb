class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_cart
  before_action :load_current_order

  def load_cart
    if current_user && current_user.current_cart.present?
      session[:cart] ||= current_user.current_cart.cart_hash
      @cart ||= Cart.new(session[:cart])
    else
      @cart ||= Cart.new(session[:cart])
    end
  end

  def load_current_order
    session[:order] ||= {}
    @current_order ||= CurrentOrder.new(session[:order])
  end
end
