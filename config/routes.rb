Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  resources :users
  resources :rooms
  resources :homeworks
  get "dashboard", to: 'dashboard#index'
  get "profile", to: 'dashboard#profile'

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
