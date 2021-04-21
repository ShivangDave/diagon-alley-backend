class CreateApiV1Addresses < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_addresses do |t|
      t.string :street_address
      t.string :apartment_no
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
