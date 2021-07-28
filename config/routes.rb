Rails.application.routes.draw do
  resources :event_managers
  resources :event_assignees
  devise_for :users, path: 'account'
  authenticated :user do

    namespace :admin do
      get "dashboard", to: 'dashboard#index'
      resources :events
      resources :users
      resources :rooms
      resources :homeworks do
        scope module: 'homeworks' do
          resources :events
        end
      end
    end

     # resources :rooms
     resources :homeworks
     resources :events
     resources :users, only: [:index, :show]
 
     get "dashboard", to: 'dashboard#index'

    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'home#index'
  
end
