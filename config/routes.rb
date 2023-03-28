Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'sessions#login'

  # Product Routes
  resources :products

  # Author Routes
  resources :authors

  # Book Routes
  resources :books

  # Student Routes
  resources :students

  # Faculty Routes
  resources :faculties

  # Users Routes
  resources :users, only: %i[new create edit update show destroy]

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  # Cars Routes
  resources :cars
  get '/search', to: 'cars#search'
  get '/download', to: 'cars#download_pdf'
end
