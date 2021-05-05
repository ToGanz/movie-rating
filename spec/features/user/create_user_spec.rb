require 'rails_helper'

RSpec.describe 'create user', type: :feature do
  scenario 'valid inputs' do
    visit signup_path

    fill_in 'Name', with: 'Tobi'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'invalid email' do
    visit signup_path
    
    fill_in 'Name', with: 'Tobi'
    fill_in 'Email', with: 'testtest.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'
    expect(page).to have_content('is invalid')
  end

  scenario 'missing name' do
    visit signup_path
    
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content("can't be blank")
  end

  scenario 'wrong password' do
    visit signup_path
    
    fill_in 'Name', with: 'tobi'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'pas'

    click_on 'Sign up'

    expect(page).to have_content("doesn't match Password")
  end
end