class LineItemsController < ApplicationController
  before_action :required_logged_in

  def create
    if !current_user.current_cart
      current_user.current_cart = current_user.carts.build(status: "")
      current_user.save
    end

    current_user.current_cart.add_item(params[:item_id])
    current_user.orders.build(status: "Completed", cart: current_user.current_cart)
    current_user.save
    current_user.current_cart.save

    redirect_to cart_path(current_user.current_cart), { notice: "Item added to cart!"}
  end
end
