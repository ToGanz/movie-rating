require "rails_helper"

RSpec.feature "logout user", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario 'user successfully logs out' do
    sign_in user
    visit root_path
    find('nav #user-settings').click
    find('nav a', text: 'Log out').click
        
    expect(page).to have_content('Signed out successfully')
    expect(page).to have_selector('nav a', text: 'Login')
    expect(page).not_to have_selector('#user-settings')
  end

end