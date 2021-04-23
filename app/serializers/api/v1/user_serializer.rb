class Api::V1::UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user
  attributes :first_name, :last_name, :email, :items_in_cart
  has_many :user_addresses

  def token
    
  end
end
