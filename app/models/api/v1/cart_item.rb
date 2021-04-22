class Api::V1::CartItem < ApplicationRecord
  belongs_to :cart, class_name: 'Api::V1::Cart'
  belongs_to :item, class_name: 'Api::V1::Item'
end
