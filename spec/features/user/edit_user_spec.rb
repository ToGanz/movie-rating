require 'rails_helper'

RSpec.describe 'edit user', type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'valid inputs' do
    sign_in user
    visit root_path
    find('nav #user-settings').click
    find('nav a', text: 'Edit Profile').click

    fill_in 'user[name]', with: "edited Name"
    fill_in 'user[email]', with: user.email
    fill_in 'user[current_password]', with: user.password
    find('.edit-button').click

    expect(page).to have_selector('#user-settings')
    expect(page).to have_content("edited Name")
  end

  scenario 'wrong password' do
    sign_in user
    visit root_path
    find('nav #user-settings').click
    find('nav a', text: 'Edit Profile').click

    fill_in 'user[name]', with: "edited Name"
    fill_in 'user[email]', with: user.email
    fill_in 'user[current_password]', with: "pas"
    find('.edit-button').click

    expect(page).to have_content("is invalid")

  end

end