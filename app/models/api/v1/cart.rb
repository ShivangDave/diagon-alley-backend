class Api::V1::Cart < ApplicationRecord
  has_many :cart_items, class_name: 'Api::V1::CartItem', dependent: :destroy
  has_many :items, through: :cart_items, class_name: 'Api::V1::Item'

  def add_item(id)
    Api::V1::CartItem.create(
      cart_id: self.id,
      item_id: id,
    )
    self.items
  end
end
