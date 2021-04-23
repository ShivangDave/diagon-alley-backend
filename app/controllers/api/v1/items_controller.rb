class Api::V1::ItemsController < ApplicationController

  before_action :authorized

  def index
    @items = Api::V1::Item.all
    render :json => @items, :status => :ok
  end

end
