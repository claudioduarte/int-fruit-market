Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'

  # USERS
  resources :users
  # LOGOUT
  get '/logout', to: 'sessions#destroy'

  # SESSIONS
  resources :sessions
  # LOGIN
  get '/login', to: "sessions#login"

  # SEARCH
  get '/search', to: "main#search"

  # FRUITS
  resources :fruits

  # VENDORS
  resources :vendors

  # VENDORS FRUITS
  resources :vendors_fruits
  # INCREMENT/DECREMENT QUANTITY
  get '/new-quantity/:type/:id', to: "vendors_fruits#new_quantity"
end
