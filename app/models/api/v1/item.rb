class Api::V1::Item < ApplicationRecord
  validates :name, :description, :price, presence: true
end
