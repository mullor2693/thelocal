Rails.application.routes.draw do
  resources :trainings
  resources :exercise_series
  resources :schedules
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
      get "/training", to: "dashboard#training", as: :dashboard_training
      scope 'training' do
        resources :exercises
        resources :workouts
      end
      get "/nutrition", to: "dashboard#nutrition", as: :nutrition
      scope 'nutrition' do
        resources :foods
        resources :diets do
          scope module: 'diets' do
            resources :diet_meals
            resources :meals do
              scope module: 'meals' do
                resources :meal_foods
              end
            end
          end
        end
      end
      
      resources :users do
        scope module: 'users' do
          resources :diets do
            scope module: 'diets' do
              resources :meals do
                scope module: 'meals' do
                  resources :meal_foods
                end
              end
            end
          end
          resources :measurements
          resources :evaluations
          get "evaluations_charts", to: "evaluations#charts", as: :evaluations_charts
          resources :weights
          resources :workouts do
            scope module: 'workouts' do
              resources :exercises
              resources :exercise_workouts
            end
          end
        end
      end
      root 'dashboard#index', as: :authenticated_root

    end

    get "/profile", to: "dashboard#profile", as: :profile

    get "/nutrition", to: "dashboard#nutrition", as: :nutrition
    scope 'nutrition' do
      resources :diets do
        scope module: 'diets' do
          resources :diet_meals
          resources :meals, except: [:index] do
            scope module: 'meals' do
              resources :meal_foods, except: [:index]
            end
          end
        end
      end
      resources :weights
      resources :foods, only: [:index, :show]

    end

    get "/physical", to: "dashboard#physical", as: :physical
    scope 'physical' do
      resources :measurements
      resources :evaluations
    end

    resources :trainings do
      scope module: 'trainings' do
        resources :workouts do
          scope module: 'workouts' do
            resources :exercises, only: [:index, :show]
            resources :exercise_workouts
          end
        end
      end
    end

    resources :exercises, only: [:index, :show]

    # resources :rooms
    resources :homeworks
    resources :events
    resources :users, only: [:index, :show]

    get "dashboard", to: 'dashboard#index'

    root 'dashboard#index', as: :authenticated_root

  end
  
  root to: "home#index"

  # match "*path", to: "home#none", via: :al
  
end
