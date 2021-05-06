FactoryBot.define do
  factory :rating do
    user_rating { Faker::Number.between(from: 1, to: 10) }
    user
    movie
  end
end
