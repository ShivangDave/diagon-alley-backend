class Api::V1::UserAddressSerializer
  include FastJsonapi::ObjectSerializer

  attributes :address_type, :address

end
