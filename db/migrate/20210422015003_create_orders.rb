class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_orders do |t|
      t.references :user, class_name: 'Api::V1::User'
      t.references :shipping_address, index: true, foreign_key: { to_table: "api_v1_addresses" }, class_name: 'Api::V1::Address'
      t.references :billing_address, index: true, foreign_key: { to_table: "api_v1_addresses" }, class_name: 'Api::V1::Address'
      t.timestamps
    end
  end
end
