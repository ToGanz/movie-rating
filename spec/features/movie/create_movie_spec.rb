require 'rails_helper'

RSpec.describe 'create movie', type: :feature do

  scenario 'not logged in' do
    visit root_path
    within find(".movie-search") do
      fill_in 'Search by Title', with: 'Titanic'
      click_on 'Search Movie'
    end

    expect(page).to have_content('You need to sign in or sign up before continuing')
  end

  scenario 'valid inputs' do
    sign_in(FactoryBot.create(:user))
    visit root_path
    within find(".movie-search") do
      fill_in 'Search by Title', with: 'Titanic'
      click_on 'Search Movie'
    end
    
    expect(page).to have_content('Titanic')
    expect(page).to have_content("19.12.1997")
    expect(page).to have_content("194")
    expect(page).to have_content("Drama, Romance")
    expect(page).to have_content("James Cameron")
    expect(page).to have_content("A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.")
    expect(page).to have_content("7.8")
  
  end

  scenario 'invalid inputs' do
    sign_in(FactoryBot.create(:user))
    visit root_path
    within find(".movie-search") do
      fill_in 'Search by Title', with: 'Ttanic'
      click_on 'Search Movie'
    end
    
    expect(page).to have_content("Could not find the entered movie.")
  end
  
end