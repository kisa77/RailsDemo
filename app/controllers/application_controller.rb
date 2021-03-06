class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize, :current_cart

  def set_current_cart
      @cart = current_cart
  end


  private
  # 当前购物车
  def current_cart
      Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end

  protected
  def authorize
      unless User.find_by_id(session[:user_id])
          redirect_to login_url, :notice => 'Please Login'
      end
  end
end
