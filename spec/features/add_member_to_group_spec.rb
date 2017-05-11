require 'rails_helper'

feature 'user adds member to group' do
  scenario "clicks link from Group page and adds to a group" do
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

    click_link "Family"
    click_link "Add a Member"
    select 'jerry', from: 'username'

    click_button "Add member"

    expect(page).to have_content 'jerry'
  end
end
