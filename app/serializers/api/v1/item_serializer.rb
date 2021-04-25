class Api::V1::ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :price, :item_images, :original_price

end
