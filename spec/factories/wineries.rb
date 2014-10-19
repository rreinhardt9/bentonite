# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :winery do
    name "#{Faker::Address.street_name} Winery"
  end

  factory :invalid_winery, class: Winery do
    name ''
  end
end
