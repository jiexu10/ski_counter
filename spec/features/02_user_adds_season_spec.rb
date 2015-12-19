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

require 'rails_helper'

feature 'user adds new season' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:seasons) { FactoryGirl.create_list(:season, 3, user: user) }

  scenario 'navigates to index, sees list sorted by year with current season first' do
    visit '/'
    expect(current_path).to eq(root_path)

    expect(page).to have_selector("ul.current-season", text: seasons.first.year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons[1].year_span)
    expect(page).to have_selector("ul.season-list li", text: seasons.last.year_span)

    expect(page.body.index(seasons.first.year_span) < page.body.index(seasons[1].year_span)).to eq(true)
    expect(page.body.index(seasons[1].year_span) < page.body.index(seasons.last.year_span)).to eq(true)
  end
end
