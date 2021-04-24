class Api::V1::ItemImage < ApplicationRecord
  belongs_to :item, class_name: 'Api::V1::Item'
  validates :img_url, presence: true
end
