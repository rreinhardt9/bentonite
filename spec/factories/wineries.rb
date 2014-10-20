# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :winery do
    sequence(:name) { "#{Faker::Address.street_name} Winery" }
    user
  end

  factory :invalid_winery, class: Winery do
    name ''
  end
end
