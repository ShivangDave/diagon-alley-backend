class Api::V1::CartsController < ApplicationController

  before_action :authorized, only: [:create]

  def index
    @cart_items = current_user.cart.items
    render :json => @cart_items, include: [:item_images], :status => :ok
  end

  def create
    @cart_items = current_user.cart.add_item(cart_params[:id])
    render :json => @cart_items, :status => :ok
  end

  private
  def cart_params
    params.require(:cart).permit(:id)
  end

end
