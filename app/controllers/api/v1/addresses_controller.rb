class Api::V1::AddressesController < ApplicationController

  def update
    byebug
  end

  private
  def address_params
    params.require(:address).permit()
  end

end
