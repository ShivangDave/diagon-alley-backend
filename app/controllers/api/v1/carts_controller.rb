class Api::V1::CartsController < ApplicationController

  before_action :authorized, only: [:index,:create]

  def index
    if current_user.cart
      @cart_items = current_user.cart.items
    else
      @cart_items = []
    end

    @billing = current_user.user_addresses.find_by(address_type: 'billing')
    @shipping = current_user.user_addresses.find_by(address_type: 'shipping')

    render :json => {
      :items => @cart_items.as_json(include: [:item_images]),
      :addresses => [{
          :billing => @billing.address.as_json(
            except: [:created_at,:updated_at]
          ),
          :shipping => @shipping.address.as_json(
            except: [:created_at,:updated_at]
          )
      }]
    }, :status => :ok
  end

  def create
    if !current_user.cart
      @cart = Api::V1::Cart.create(user_id: current_user.id)
    end
    @cart_items = current_user.cart.add_item(cart_params[:id])
    render :json => @cart_items, :status => :ok
  end

  def destroy
    @items = current_user.cart_items.where(item_id: params[:id])
    @items.each { |i| i.destroy }
    render :json => { "msg": "Deleted.." }, :status => :ok
  end

  def update
    # byebug
    if params[:todo] == 'add'
      current_user.cart.add_item(params[:id])
    elsif params[:todo] == 'remove'
      @item = current_user.cart_items.find_by(item_id: params[:id])
      @item.destroy
    end

    @cart_items = current_user.cart.items
    render :json => @cart_items, include: [:item_images], :status => :ok
  end

  private
  def cart_params
    params.require(:cart).permit(:id)
  end

end
