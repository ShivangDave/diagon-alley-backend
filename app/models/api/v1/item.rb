class Api::V1::Item < ApplicationRecord
  has_many :cart_items, class_name: 'Api::V1::CartItem'
  has_many :items, through: :order_items, class_name: 'Api::V1::Item'
  
  validates :name, :description, :price, presence: true
end
