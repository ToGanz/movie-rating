require 'rails_helper'

RSpec.describe 'rate movie', type: :feature do
  scenario 'not logged in' do
    movie = FactoryBot.create(:movie)
    visit movie_path(movie)

    expect(page).not_to have_content('Rate Movie')
  end

  scenario 'rating is successful' do
    user = FactoryBot.create(:user)
    sign_in(user)
    movie = FactoryBot.create(:movie)
    visit movie_path(movie)
    
    fill_in 'rating[user_rating]', with: 5
    find('.rate-button').click

    expect(page).to have_content('Your Rating: 5')
  end
end
