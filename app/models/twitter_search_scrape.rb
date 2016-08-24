class TwitterSearchScrape < ApplicationRecord

  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/poltergeist'

  include Capybara::DSL
  # Capybara.default_driver = :poltergeist # for production
  Capybara.default_driver = :selenium # for testing

  def twitter_advanced_search
    visit "https://twitter.com/search-advanced"
    fill_in 'All of these words', with: 'Kim Kardashian'
    select 'English (English)', from: 'Written in'
    within :css, 'div#datepicker' do
      fill_in 'From this date', with: "2015-08-21"
      fill_in 'to', with: "2015-09-21"
    end
    click_button 'Search'
  end

end
