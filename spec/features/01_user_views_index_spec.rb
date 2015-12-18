# As a user
# I want to view the seasons
# So that I can make new entries in the appropriate place
#
# Acceptance Criteria
#
# - I must see the year of each season
# - I must see the year listed starting from the most recent

require 'rails_helper'

feature 'user views index' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:seasons) { FactoryGirl.create_list(:season, 3, user: user) }

  scenario 'navigates to index, sees list sorted by year with current season first' do
    visit '/'
    expect(current_path).to eq(root_path)

    expect(page).to have_selector("div.current-season", text: seasons.first.year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons[1].year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons.last.year_span)

    expect(page.body.index(seasons.first.year_span) < page.body.index(seasons[1].year_span)).to eq(true)
    expect(page.body.index(seasons[1].year_span) < page.body.index(seasons.last.year_span)).to eq(true)
  end
end
