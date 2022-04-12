FactoryBot.define do
  factory :subscription do
    tea_id { Faker::Invoice.creditor_reference }
    tea_name { Faker::Color.color_name }
    price { Faker::Number.number(digits: 4) }
    status { 0 }
    frequency { 0 }
    user
  end
end
