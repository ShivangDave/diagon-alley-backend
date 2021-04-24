class CreateItemImages < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_item_images do |t|
      t.references :item, class_name: 'Api::V1::Item'
      t.string :img_url

      t.timestamps
    end
  end
end
