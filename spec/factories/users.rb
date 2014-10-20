FactoryGirl.define do
  factory :user do
    sequence(:name) { Faker::Name.name }
    sequence(:email) { Faker::Internet.email }
    password Faker::Internet.password(8)

    trait :admin do
      role 'admin'
    end

  end
end
