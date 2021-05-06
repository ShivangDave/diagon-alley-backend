class Api::V1::OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    render :json => @orders.to_json(
      include: {
        items: {
          include: [
            :item_images
          ],
          except: [ :created_at, :updated_at ]
        }
      }
    )
  end

  def create
    @billing = current_user.user_addresses.find_by(address_type: 'billing')
    @shipping = current_user.user_addresses.find_by(address_type: 'shipping')

    @order = Api::V1::Order.create(
      user_id: current_user.id,
      shipping_address_id: @shipping.id,
      billing_address_id: @billing.id
    )

    current_user.cart_items.each do |cart_item|
      @order_item = Api::V1::OrderItem.create(
        order_id: @order.id,
        item_id: cart_item.item_id,
        status: 'delivered'
      )
    end

    if @order && @order.items.length == current_user.cart_items.length
      current_user.cart.destroy
      render :json => {
        "msg": "Order fulfilled.",
        "order": @order, include: [:items]
      }
    else
      render :json => { "msg": "Order failed.." }
    end
  end

end
