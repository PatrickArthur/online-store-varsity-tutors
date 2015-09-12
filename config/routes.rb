Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  # ...
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: "products#index"

  resources :users, only: [:index, :show, :create]

  resources :products, only: [:index, :show, :new, :create]
end
