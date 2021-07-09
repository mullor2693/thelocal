Rails.application.routes.draw do
  devise_for :users, path: 'account'
  authenticated :user do

    resources :events
    resources :users
    resources :rooms
    resources :homeworks

    get "dashboard", to: 'dashboard#index'
    
    namespace :admin do
      get "dashboard", to: 'dashboard#index'
      resources :events
      resources :users
      resources :rooms
      resources :homeworks
    end
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
