class TwitterSearchApiController < ApplicationController

  def search
    new_search = TwitterSearchApi.new
    result = new_search.search_by_term_and_date(cleaned_search_params['term'],
                                                cleaned_search_params['date'])
    render json: result
  end

  private
  def search_params
    params.permit('date', 'term')
  end

  def cleaned_search_params
    new_params = search_params
    new_params['date'] = new_params['date'].gsub('_', ' ')
    new_params
  end

end
