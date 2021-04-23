class Api::V1::User < ApplicationRecord
  has_secure_password

  has_many :user_addresses, class_name: 'Api::V1::UserAddress'
  has_many :addresses, through: :user_addresses, class_name: 'Api::V1::Address'

  has_one :cart, class_name: 'Api::V1::Cart'
  has_many :cart_items, through: :cart, class_name: 'Api::V1::CartItem'

  has_many :orders, class_name: 'Api::V1::Order'

  validates :first_name, :last_name, :email, :password_digest, :agreement, presence: true
  validates :email, :uniqueness => true, email: true

  def items_in_cart_length
    self.items_in_cart.length
  end

  def items_in_cart
    self.cart_items.map { |c_i| c_i.item }
  end

  def ordered_items
    self.orders.map { |o| o.items }
  end

  def token
    @user = { user_id: self.id }
    # 3600s is 1 hr
    exp = Time.now.to_i + 4 * 3600
    exp_payload = { data: @user, exp: exp }

    JWT.encode exp_payload, ENV['JWT_TOKEN_KEY'], 'HS256'
  end

end
