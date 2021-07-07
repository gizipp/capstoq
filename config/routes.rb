Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :stocks do
    collection do
      get :fetch
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stocks, only: [:index] do
        collection do
          get 'data/:ticker',      to: "stocks#data"
          get 'sentiment/:ticker', to: "stocks#sentiment"
        end
      end

      resources :users do
        collection do
          post 'signup'
          post 'signin'
        end
      end
    end
  end


end
