# As a user
# I want to view the seasons
# So that I can make new entries in the appropriate place
#
# Acceptance Criteria
#
# - When I log in, I must see my seasons
# - I must see the year listed starting from the most recent
# - When I am not logged in, I should not see the list of seasons

require 'rails_helper'

feature 'user views the index for the correct user' do
  let(:user) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let!(:seasons) { FactoryGirl.create_list(:season, 3, user: user) }
  let!(:seasons2) { FactoryGirl.create_list(:season, 3, user: user2) }


  scenario 'sign in and view user season index' do
    visit '/'
    sign_in_as(user)

    expect(page).to have_selector("ul.current-season", text: seasons.first.year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons[1].year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons.last.year_span)

    expect(page).to_not have_selector("ul.current-season", text: seasons2.first.year_span)
    expect(page).to_not have_selector("ul.season-list li", text: seasons2[1].year_span)
    expect(page).to_not have_selector("ul.season-list li", text: seasons2.last.year_span)

    expect(page.body.index(seasons.first.year_span) < page.body.index(seasons[1].year_span)).to eq(true)
    expect(page.body.index(seasons[1].year_span) < page.body.index(seasons.last.year_span)).to eq(true)
  end

  scenario 'navigates to index, sees list sorted by year with current season first' do
    visit '/'
    sign_in_as(user2)

    expect(page).to have_selector("ul.current-season", text: seasons2.first.year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons2[1].year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons2.last.year_span)

    expect(page).to_not have_selector("ul.current-season", text: seasons.first.year_span)
    expect(page).to_not have_selector("ul.season-list li", text: seasons[1].year_span)
    expect(page).to_not have_selector("ul.season-list li", text: seasons.last.year_span)
  end

end
