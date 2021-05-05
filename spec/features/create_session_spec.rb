require 'rails_helper'

RSpec.describe 'login user', type: :feature do
  before do
    visit signup_path

    fill_in 'Name', with: 'Tobi'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'
    click_on 'Tobi'
    click_on 'Log out'
  end

  scenario 'valid inputs' do
    click_on 'Login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    
    expect(page).to have_content('Signed in successfully')
  end
end