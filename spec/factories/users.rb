# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    producer false
    director false
    actor false
    after_build { |u| u.password = u.password_confirmation = "MyString" }
  end
end
