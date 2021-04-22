class Api::V1::Cart < ApplicationRecord
  has_many :cart_items, class_name: 'Api::V1::CartItem'
  has_many :items, through: :cart_items, class_name: 'Api::V1::Item'
end
