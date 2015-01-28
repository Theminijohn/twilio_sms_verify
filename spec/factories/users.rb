# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do

    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    password '12345678'

    after(:create) {|user| user.set_phone_attributes }

    factory :verified_user do
      phone_varified true
      phone_verification_code nil
    end

  end
end
