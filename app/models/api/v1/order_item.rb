class Api::V1::OrderItem < ApplicationRecord
  belongs_to :order, class_name: 'Api::V1::Order'
  belongs_to :item, class_name: 'Api::V1::Item'
end
