class TwitterSearchApi < ApplicationRecord

  def search_by_term_and_date(term, date) # date should be YYYY-MM-DD
    @search_results = $twitter.search(term, {until: date, result_type: "popular",
      lang: 'en', count: 100})
  end

end
