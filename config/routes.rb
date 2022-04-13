Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :destroy]
      resources :users do
        resources :subscriptions, only: [:index, :update]
      end
    end
  end
end
