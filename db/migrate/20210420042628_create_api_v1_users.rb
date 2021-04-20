class CreateApiV1Users < ActiveRecord::Migration[6.1]
  def change
    create_table :api_v1_users do |t|
      t.string :first_name
      t.string :last_name
      t.text :email
      t.string :password_digest
      t.boolean :agreement, :default => false

      t.timestamps
    end
  end
end
