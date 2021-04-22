class Api::V1::User < ApplicationRecord
  has_secure_password

  has_many :user_addresses, class_name: 'Api::V1::UserAddress'
  has_many :addresses, through: :user_addresses, class_name: 'Api::V1::Address'

  has_one :cart, class_name: 'Api::V1::Cart'
  has_many :cart_items, through: :cart, class_name: 'Api::V1::Item'


  validates :first_name, :last_name, :email, :password_digest, :agreement, presence: true
  validates :email, :uniqueness => true, email: true
end
