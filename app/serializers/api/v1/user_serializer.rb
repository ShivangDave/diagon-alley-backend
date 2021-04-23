class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user
  attributes :token, :first_name, :last_name, :email, :items_in_cart_length
  # has_many :user_addresses

end
