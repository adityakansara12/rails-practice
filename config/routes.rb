Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'faculties#index'

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
end
