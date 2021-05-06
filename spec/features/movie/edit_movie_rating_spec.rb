require 'rails_helper'

RSpec.describe 'rate movie', type: :feature do
  scenario 'not logged in' do
    movie = FactoryBot.create(:movie)
    visit movie_path(movie)

    expect(page).not_to have_content('Edit Rating')
  end

  scenario 'rating is edited successful' do
    # user = FactoryBot.create(:user)
    # sign_in(user)
    # movie = FactoryBot.create(:movie)
    rating = FactoryBot.create(:rating, user_rating: 5)
    sign_in(rating.user)
    visit movie_path(rating.movie)
    
    # fill_in 'rating[user_rating]', with: 5
    # click_on 'Rate Movie'
    expect(page).to have_content('Your Rating: 5')

    fill_in 'rating[user_rating]', with: 4
    click_on 'Edit Rating'
    expect(page).to have_content('Your Rating: 4')
  end
end
