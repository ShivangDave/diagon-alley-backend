class Api::V1::Address < ApplicationRecord
  validates :street_address, :apartment_no, :city, :state, :zip_code, presence: true
end
