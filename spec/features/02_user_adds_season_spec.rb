# As a user
# I want to add new seasons
# So that I can create new entries for a new season
#
# Acceptance Criteria
#
# - I will create a new season if all the fields in the form are filled
# - I will be brought to the show page if the season is create successfully
# - The new season should appear on the index
# - I must be returned to the form page if an error is made
# - I must not be able to create a new season if not signed in under the right user

require 'rails_helper'

feature 'user adds new season' do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }

  scenario 'make new season from season index' do
    visit '/'
    sign_in_as(user)

    click_link('Add New Season')

    fill_in('Start Year', with: '2010')
    click_button('Add New Season')

    expect(current_path).to eq(user_seasons_path(user))
    expect(page).to have_selector("div.flash-notice", text: 'Season added successfully!')
    expect(page).to have_selector("ul.current-season", text: '2010-2011')
  end

  scenario 'fill in season form incorrectly' do
    visit '/'
    sign_in_as(user)

    click_link('Add New Season')

    fill_in('Start Year', with: 'asd1')
    click_button('Add New Season')

    expect(page).to have_selector("div.flash-error", text: 'Please enter valid 4-digit year.')
    expect(find_field('Start Year').value).to eq('asd1')
  end

  scenario 'user visits another user page' do
    visit '/'
    sign_in_as(user)

    visit(user_seasons_path(user2))

    expect(page).to_not have_content('Add New Season')
  end
end
