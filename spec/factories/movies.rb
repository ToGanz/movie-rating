FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.word }
    release_date { "19 Dec 1997" }
    runtime { Faker::Number.number(digits: 3) }
    genre { Faker::Lorem.word }
    directors { Faker::Lorem.word }
    poster { "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg" }
    plot { Faker::Lorem.sentence(word_count: 10) }
    imdbRating { Faker::Number.decimal(l_digits: 1) }
  end
end
