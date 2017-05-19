require 'rails_helper'

feature 'home page' do
  scenario "visits home page" do
    visit root_path
    expect(page).to have_content("Welcome to")
    expect(page).to have_link("Login")
    expect(page).to have_link("Sign Up")
  end

  scenario 'user logs in' do
    visit root_path
    click_link 'Login'
    expect(page).to have_content('Log in')
    expect(page).to have_link('Sign up')
    expect(page).to have_link('Forgot your password?')
  end

  feature 'user forgot their password' do
    scenario 'user does not enter any email in the field' do
      visit root_path
      click_link 'Login'
      click_link 'Forgot your password?'
      click_button 'Send me reset password instructions'

      expect(page).to have_content("Email can't be blank")
    end
  end
end
