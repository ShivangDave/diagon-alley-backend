class CreateApiV1Items < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_items do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
