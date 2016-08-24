class TwitterSearchScrape < ApplicationRecord

  require 'capybara'
  require 'capybara/dsl'
  require 'capybara/poltergeist'

  include Capybara::DSL
  # Capybara.default_driver = :poltergeist # for production
  Capybara.default_driver = :selenium # for testing

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
    visit "https://twitter.com/search-advanced"
    fill_in 'All of these words', with: @term
    select 'English (English)', from: 'Written in'
    page.execute_script("$('#since').datepicker('setDate', '#{@start_date}')")
    page.execute_script("$('#until').datepicker('setDate', '#{@end_date}')")
    click_button 'go'
    click_button 'go'
  end

  def send_search
  end

end
