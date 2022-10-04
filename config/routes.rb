Rails.application.routes.draw do
  resources :wishlists
  resources :carts
  resources :orders
  resources :users
  resources :books
  resources :publishers
  resources :authors
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
