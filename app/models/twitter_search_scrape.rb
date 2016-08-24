class TwitterSearchScrape < ApplicationRecord

  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/poltergeist'

  include Capybara::DSL
  Capybara.default_driver = :poltergeist # for production
  # Capybara.default_driver = :selenium # for testing

  def twitter_advanced_search
    visit "https://twitter.com/search-advanced"
  end

end
