class Api::V1::ItemsController < ApplicationController

  # before_action :authorized

  def index
    @items = Api::V1::Item.all
    render :json => Api::V1::ItemSerializer.new(@items).serializable_hash, :status => :ok
  end

end
