FactoryBot.define do
  factory :subscription do
    tea_id { Faker::Invoice.creditor_reference }
    tea_name { Faker::Color.color_name }
    price { nil }
    status { 0 }
    frequency { 0 }
    user
  end
end
