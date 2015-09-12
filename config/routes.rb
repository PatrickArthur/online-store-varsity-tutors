Rails.application.routes.draw do
  devise_for :users
  require 'sidekiq/web'
  # ...
  mount Sidekiq::Web, at: '/sidekiq'
end
