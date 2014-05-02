FactoryGirl.define do

  factory :user do
    card_number { Faker::Number.number(9) }
    pin { Faker::Number.number(4) }
  end

end
