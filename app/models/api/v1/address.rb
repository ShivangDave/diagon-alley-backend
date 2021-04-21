class Api::V1::Address < ApplicationRecord
  validates :street_address, :apartment_number, :city, :state, :zip_code, presence: true
end
