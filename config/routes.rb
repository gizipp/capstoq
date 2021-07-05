Rails.application.routes.draw do
  root 'home#index'

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
      end
  end
end
