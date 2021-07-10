Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :stocks
      resources :stock_favorites, only: [:show]

      root to: "users#index"
    end
  root 'home#index'

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stocks, only: [:index] do
        collection do
          get 'data/:ticker',         to: "stocks#data"
          get 'sentiment/:ticker',    to: "stocks#sentiment"
          get '/favorites',           to: "stocks#favorites"
          post '/:stock_id/favorite', to: "stocks#favorite"
        end
      end

      resources :users, only: [] do
        collection do
          post 'signup'
          post 'signin'
          post 'update'
        end
      end
    end
  end


end
