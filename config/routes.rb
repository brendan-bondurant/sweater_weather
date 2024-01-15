Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do
      resources :forecast, only: [:index]
      resources :users, only: [:create]

    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
