FactoryGirl.define do

  factory :user do
    card_number { Faker::Number.number(9) }
    pin { Faker::Number.number(4) }
  end

  factory :account do
    title { Faker::Lorem.word}
    balance { Faker::Number.decimal(4,2)}
    user
  end

end
