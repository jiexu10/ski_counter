# As a user
# I want to sign in so I can save my information
# So that I can create new seasons and days
#
# Acceptance Criteria
#
# - I must be able to sign in

require 'rails_helper'

feature 'user signs in' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:seasons) { FactoryGirl.create_list(:season, 3, user: user) }

  scenario 'visit root page and sign in' do
    visit '/'
    sign_in_as(user)

    expect(page).to have_content("Signed in as #{user.name}")
  end
end
