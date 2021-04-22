# require 'faker'
Api::V1::User.destroy_all
Api::V1::Address.destroy_all
Api::V1::UserAddress.destroy_all
Api::V1::Item.destroy_all

u1 = Api::V1::User.create(
  first_name: 'Shivang',
  last_name: 'Dave',
  email: 'mail@shivangdave.com',
  password: '1234',
  agreement: true
)

a1 = Api::V1::Address.create(
  street_address: 'Some street',
  apartment_no: 'Some apt',
  city: 'Stafford',
  state: 'TX',
  zip_code: '77477'
)

a2 = Api::V1::Address.create(
  street_address: 'Some St',
  apartment_no: 'Some 404',
  city: 'Houston',
  state: 'TX',
  zip_code: '77054'
)

ua1 = Api::V1::UserAddress.create(
  user_id: u1.id,
  address_id: a1.id,
  address_type: 'shipping'
)

ua2 = Api::V1::UserAddress.create(
  user_id: u1.id,
  address_id: a2.id,
  address_type: 'billing'
)

(1..10).each do |i|
  Api::V1::Item.create(
    name: Faker::Book.title,
    description: Faker::Book.publisher,
    price: Faker::Number.decimal(l_digits: 2)
  )
end
