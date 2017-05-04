require 'rails_helper'

feature 'user Group page' do
  scenario "clicks link from Profile page and creates a group" do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Password', with: jerry.password

    click_button 'Log in'
    click_link 'Create Group'

    fill_in 'Name', with: 'Family'
    click_button 'Create Group'

    expect(page).to have_content 'Family'
  end

  scenario "Group is visible on profile as link" do
    jerry = FactoryGirl.create(:user)
    visit root_path
    visit new_user_session_path
    fill_in 'Email', with: jerry.email
    fill_in 'Password', with: jerry.password

    click_button 'Log in'
    click_link 'Create Group'

    fill_in 'Name', with: 'Family'
    click_button 'Create Group'

    expect(page).to have_content 'Family'
    expect(page).to have_link 'Delete'
  end
end
