require 'factory_girl_rails'

FactoryGirl.define do
  factory :season do
    sequence(:start_year) { |n| "#{2010-n}" }
    sequence(:end_year) { |n| "#{2011-n}" }
    user
  end

  factory :day do
    sequence(:date) { |n| "#{season.start_year}-11-#{n}"}
    location "someskiplace"
    weather "some weather"
    notes "yo it was fun"
    season

    factory :past_day do
      sequence(:date) { |n| "#{season.start_year}-11-#{n}"}
      location "somepastskiplace"
      weather "somepastweather"
      notes "yo it was fun back then"
      season
    end
  end

  factory :user do
    provider "facebook"
    uid "123"
    name "namestring"
    email "testemail@email.com"
    user_image "fakeimageurl.jpg"
    facebook_url "fakefacebookurl.url"
  end
end
