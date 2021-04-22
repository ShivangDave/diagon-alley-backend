class CreateApiV1CartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_cart_items do |t|
      t.references :cart, class_name: 'Api::V1::Cart'
      t.references :item, class_name: 'Api::V1::Item'

      t.timestamps
    end
  end
end
