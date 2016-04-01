require 'faker'

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    mobile Faker::PhoneNumber.cell_phone
  end
end