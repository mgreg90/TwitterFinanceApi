class TwitterSearchScrapeController < ApplicationController

  def search
    new_search = TwitterSearchScrape.new
    new_search.set_vars(
                          params[:term],
                          params[:start_date],
                          params[:end_date]
                        )
    new_search.twitter_advanced_search
  end
end
