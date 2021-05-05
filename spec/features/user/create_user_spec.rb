require 'rails_helper'

RSpec.describe 'create user', type: :feature do
  let(:user) { FactoryBot.build(:user) }

  scenario 'valid inputs' do
    visit root_path
    find('nav a', text: 'Signup').click

    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click

    expect(page).to have_selector('#user-settings')
    expect(page).to have_content('You have signed up successfully.')
  end

  scenario 'invalid email' do
    visit signup_path
    
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: "test.com"
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click
    
    expect(page).not_to have_selector('#user-settings')
    expect(page).to have_content('is invalid')
  end

  scenario 'missing name' do
    visit signup_path
    
    fill_in 'user[name]', with: ''
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click

    expect(page).not_to have_selector('#user-settings')
    expect(page).to have_content("can't be blank")
  end

  scenario 'wrong password' do
    visit signup_path
    
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: 'pas'
    find('.sign-up-button').click

    expect(page).not_to have_selector('#user-settings')
    expect(page).to have_content("doesn't match Password")
  end
end