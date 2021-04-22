class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_order_items do |t|
      t.references :order, class_name: 'Api::V1::Order'
      t.references :item, class_name: 'Api::V1::Item'
      t.text :status

      t.timestamps
    end
  end
end
