class CreateApiV1UserAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_user_addresses do |t|
      t.references :user, class_name: 'Api::V1::User'
      t.references :address, class_name: 'Api::V1::Address'
      t.string :address_type
      t.timestamps
    end
  end
end
