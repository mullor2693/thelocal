Rails.application.routes.draw do
  resources :events
  devise_for :users, path: 'account'
  resources :users
  resources :rooms
  resources :homeworks
  get "dashboard", to: 'dashboard#index'
  get "profile", to: 'dashboard#profile'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
