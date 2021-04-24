class Api::V1::Item < ApplicationRecord
  has_many :cart_items, class_name: 'Api::V1::CartItem'
  has_many :items, through: :order_items, class_name: 'Api::V1::Item'

  has_many :item_images, class_name: 'Api::V1::ItemImage'
  validates :name, :description, :price, presence: true
end
