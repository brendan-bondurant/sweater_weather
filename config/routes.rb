Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do
      resources :forecast, only: [:index]
      resources :users
    end
    namespace :v1 do
      resources :munchies
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
