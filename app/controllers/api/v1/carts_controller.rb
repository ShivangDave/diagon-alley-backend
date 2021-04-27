class Api::V1::CartsController < ApplicationController

  before_action :authorized, only: [:create]

  def create
    @cart_items = current_user.cart.add_item(cart_params[:id])
    render :json => @cart_items, :status => :ok
  end

  private
  def cart_params
    params.require(:cart).permit(:id)
  end

end
