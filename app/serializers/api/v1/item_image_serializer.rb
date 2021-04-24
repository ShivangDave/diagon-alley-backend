class Api::V1::ItemImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :img_url
end
