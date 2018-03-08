class CartsController < ApplicationController
  before_action :current_cart, only: [:show, :checkout]
  before_action :required_logged_in
  helper_method :current_cart

  def show
  end

  def checkout
    current_cart.checkout
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(current_cart), { notice: "Checked out!" }
  end

  def current_cart
    @cart = Cart.find_by_id(params[:id])
  end
end
