FactoryBot.define do
  factory :rating do
    user_rating { Faker::Number.decimal(l_digits: 1) }
    user
    movie
  end
end
