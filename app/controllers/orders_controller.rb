class OrdersController < ApplicationController
  before_action :required_logged_in

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find_by_id(params[:id])
  end
end
