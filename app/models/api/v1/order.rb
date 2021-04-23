class Api::V1::Order < ApplicationRecord
  has_many :order_items, class_name: 'Api::V1::OrderItem'
  has_many :items, through: :order_items, class_name: 'Api::V1::Item'

  belongs_to :user, class_name: 'Api::V1::User'
end
