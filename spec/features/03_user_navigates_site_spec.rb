# As a user
# I want to navigate the pages
# So that I can see the information relevant to me
#
# Acceptance Criteria
#
# - I will be brought to my user page after I sign in
# - I will be brought to the home page if I click the nav bar title
# - TODO breadcrumbs

require 'rails_helper'

feature 'functional navigation' do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'sign in as user' do
    visit '/'
    sign_in_as(user)

    expect(current_path).to eq(user_seasons_path(user))
    expect(page).to have_content(user.name)
    expect(page).to have_content('Seasons')
  end

  scenario 'click nav bar title link' do
    visit user_seasons_path(user)
    expect(current_path).to eq(user_seasons_path(user))

    click_link('Polar Peaks')
    expect(current_path).to eq('/')
  end
end
