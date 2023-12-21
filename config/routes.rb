require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :brands
  resources :books
  resources :buyers
  resources :products
  resources :comments
  resources :ratings
  resources :carts, only: [:show, :index, :edit]
  resources :cart_items, only: [:update, :destroy]

  resources :products do
    resources :comments, only: [:create]
  end
  
  post 'products/:id/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'


  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  #root "home#index"

  root to: 'products#index'
  
end
