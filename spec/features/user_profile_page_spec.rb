require 'rails_helper'

feature 'user Profile page' do
  scenario "clicks link from index page and goes to profile page" do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Password', with: jerry.password
    click_button 'Log in'

    expect(page).to have_content jerry.username
    expect(page).to have_content jerry.email
    expect(page).to have_content "Your Groups:"
    expect(page).to have_link "Create Group"
    expect(page).to have_link "Edit Your Profile"
  end
end
