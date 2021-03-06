# As a user
# I want to see the ski days index for a season
# So that I can see how many days of skiing occurred in that season and the dates
#
# Acceptance Criteria
#
# - I will be navigate to the ski day index from the seasons index
# - I should see a list of days starting with the most recent at the top

require 'rails_helper'

feature 'user views ski day index' do
  let(:user) { FactoryGirl.create(:user) }
  let(:season) {FactoryGirl.create(:season, user: user)}
  let!(:days) {FactoryGirl.create_list(:day, 3, season: season)}

  scenario 'user navigates to ski day index from seasons index' do
    visit user_seasons_path(user)

    click_link(season.year_span)

    days.each_with_index do |day, index|
      expect(page).to have_selector("ul.day-list li", text: day.date_string)
      unless index == 0
        expect(page.body.index(days[index-1].date_string) < page.body.index(days[index].date_string)).to eq(days[index-1].date > days[index].date)
      end
    end
  end
end
