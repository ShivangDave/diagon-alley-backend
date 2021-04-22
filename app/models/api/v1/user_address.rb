class Api::V1::UserAddress < ApplicationRecord
  belongs_to :user, class_name: 'Api::V1::User'
  belongs_to :address, class_name: 'Api::V1::Address'
end
