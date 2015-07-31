Rails.application.routes.draw do
  resources :companies
  resources :customers
  resources :users
  resources :financial_data
  resources :twitter_data
  resources :smarties

  get 'home' => 'home#home', as: :home

  root :to => 'home#home'  


  # Last route in routes.rb that essentially handles routing errors
  get '*a', to: 'errors#routing'
end
