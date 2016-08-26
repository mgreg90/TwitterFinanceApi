class TwitterSearchScrape < ApplicationRecord

  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/poltergeist'
  require 'nokogiri'

  include Capybara::DSL
  # Capybara.default_driver = :poltergeist # for production
  Capybara.default_driver = :selenium # for testing

  Capybara.default_selector = :css

  def set_vars(term, start_date, end_date)
    @term = term
    @start_date = start_date
    @end_date = end_date
  end

  def clean_dates
    @start_date = Date.strptime(@start_date, "%Y-%m-%d")
    @end_date = Date.strptime(@end_date, "%Y-%m-%d")
  end

  def twitter_advanced_search
    # dates must be in YYYY-MM-DD format
    @session = Capybara::Session.new(:selenium)
    @session.visit "https://twitter.com/search-advanced"
    @session.fill_in 'All of these words', with: @term
    @session.select 'English (English)', from: 'Written in'
    @session.execute_script("$('#since').datepicker('setDate', '#{@start_date}')")
    @session.execute_script("$('#until').datepicker('setDate', '#{@end_date}')")
    @session.click_button 'go' # just for a click out so that some open picker closes
    @session.click_button 'go'
    puts @session.html
    # @session.should Capybara.have_content('div.tweet')
    @session.all('div.tweet').each do |tweet|
      p tweet
    end
  end

end
