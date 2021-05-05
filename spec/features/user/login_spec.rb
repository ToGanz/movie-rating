require 'rails_helper'

RSpec.describe 'login user', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'valid inputs' do
    visit root_path
    find('nav a', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.login-button').click
    
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_selector('#user-settings')
  end

  scenario 'invalid inputs' do
    visit root_path
    find('nav a', text: 'Login').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'pw'
    find('.login-button').click
    
    expect(page).to have_content('Invalid Email or password')
    expect(page).not_to have_selector('#user-settings')
  end
end