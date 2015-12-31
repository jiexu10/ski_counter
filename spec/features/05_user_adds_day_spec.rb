# As a user
# I want to add new days
# So that I can record the information for that day
#
# Acceptance Criteria
#
# - I will create a new day if all the fields in the form are filled
# - I will be brought to the show page for the day if the day is create successfully
# - The new day should appear on the season show page
# - I must be returned to the form page if an error is made
# - I must not be able to create a new day if not signed in under the right user

require 'rails_helper'

feature 'user adds new season' do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let!(:season) { FactoryGirl.create(:season, user: user) }

  scenario 'make new day from season show page' do
    visit '/'
    sign_in_as(user)

    click_link(season.year_span)

    click_link('Add New Day')

    fill_in('Date', with: "#{season.start_year}-11-20")
    fill_in('Location', with: 'location1')
    fill_in('Weather', with: 'weather1')
    fill_in('Notes', with: 'notes1')
    click_button('Add New Day')

    expect(page).to have_selector("div.flash-notice", text: "Day Created Successfully!")
    expect(page).to have_content("#{season.start_year}-11-20")
    expect(page).to have_content('location1')
    expect(page).to have_content('weather1')
    expect(page).to have_content('notes1')
  end

  scenario 'fill in day form with invalid date' do
    visit '/'
    sign_in_as(user)

    click_link(season.year_span)

    click_link('Add New Day')

    fill_in('Date', with: "asdf1")
    click_button('Add New Day')

    expect(page).to have_selector("div.flash-error", text: "Day Created Successfully!")
    expect(page).to have_content("#{season.start_year}-11-20")
    expect(page).to have_content('location1')
    expect(page).to have_content('weather1')
    expect(page).to have_content('notes1')


    fill_in('Start Year', with: 'asd1')
    click_button('Add New Season')

    expect(page).to have_content('Please enter valid 4-digit year.')
    expect(find_field('Start Year').value).to eq('asd1')
  end

  scenario 'user visits another user page' do
    visit '/'
    sign_in_as(user)

    visit(user_seasons_path(user2))

    expect(page).to_not have_content('Add New Season')

  end
end
