Rails.application.routes.draw do
  require 'sidekiq/web'
  # ...
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: "products#index"

  resources :users, only: [:index, :show, :create, :new]

  resources :products, only: [:index, :show, :new, :create]
end
