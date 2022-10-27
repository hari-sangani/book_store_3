require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  scope "(:locale)", locale: /en|de/ do
    get 'pages/home'
    get 'pages/about'
    get 'pages/contact'
    resources :wishlists
    resources :carts
    resources :orders
    resources :books
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => '/sidekiq'
end
