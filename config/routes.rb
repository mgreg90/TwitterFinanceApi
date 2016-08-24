Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api' => 'twitter_search_api#search'
  get '/search' => 'twitter_search_scrape#search'
end
