# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vessel do
    sequence(:name) { |n| "1000-#{n}" }
    capacity 1000
  end

  factory :invalid_vessel, class: Vessel do
    name ''
    capacity 'alot'
  end
end
