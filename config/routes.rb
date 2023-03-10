Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "authors#index"

  # Product Routes
  resources :products

  # Author Routes
  resources :authors

  # Book Routes
  resources :books
end
