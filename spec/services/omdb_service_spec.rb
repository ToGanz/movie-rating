require 'rails_helper'

RSpec.describe OmdbService do

  context 'correct title is provided' do
    it 'is valid' do
      movie, error = OmdbService.find_or_create_from_api("Titanic")
      expect(movie).to be_valid
    end
  end

  context 'incorrect title is provided' do
    it 'is not found' do
      movie, error = OmdbService.find_or_create_from_api("Ttanic")
      expect(movie).to be_nil
      expect(error).to eq("Movie not found!")
    end
  end

  context 'movie is already in the database' do
    it 'is read instead of created' do
      movie, error = OmdbService.find_or_create_from_api("Titanic")
      movie2, error2 = OmdbService.find_or_create_from_api("Titanic")
      expect(movie.id).to eq(movie2.id)
    end
  end

end
