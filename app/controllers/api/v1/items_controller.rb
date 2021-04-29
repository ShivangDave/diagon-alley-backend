class Api::V1::ItemsController < ApplicationController

  before_action :authorized, only: [:destroy]
  before_action :find_item, only: [:show]

  def index
    @items = Api::V1::Item.all
    render :json => Api::V1::ItemSerializer.new(@items).serializable_hash, :status => :ok
  end

  def show
    if @item
      render :json => Api::V1::ItemSerializer.new(@item).serializable_hash, :status => :ok
    else
      render :json => { "error": "Item not found.." }, :status => :not_found
    end
  end


  private
  def find_item
    @item = Api::V1::Item.find_by(id: params[:id])
  end

end
