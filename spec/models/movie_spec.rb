require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject do
    Movie.create(
      title: "Titanic",
      release_date: "19 Dec 1997",
      runtime: 194,
      genre: "Drama, Romance",
      directors: "James Cameron",
      poster: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg",
      plot: "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",
      imdbRating: 7.8
    )
  end

  context 'all required fields are present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
