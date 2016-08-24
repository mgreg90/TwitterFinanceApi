class TwitterSearchApi < ApplicationRecord

  def search_by_term_and_date(term, date) # date should be YYYY-MM-DD
    @search_results = $twitter.search(term, {date: date, result_type: "mixed",
      count: 10})
  end

end
