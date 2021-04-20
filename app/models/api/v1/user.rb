class Api::V1::User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :password_digest, :agreement, presence: true
  validates :email, :uniqueness => true, email: true
end
