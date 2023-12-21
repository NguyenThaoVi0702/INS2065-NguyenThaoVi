require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :brands
  resources :books
  resources :buyers
  resources :products do
  resources :comments, only: [:create, :destroy]
  resources :ratings, only: [:create, :destroy] # Nested resource for ratings
  end


  
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  #root "home#index"

  root to: 'products#index'
  
end
