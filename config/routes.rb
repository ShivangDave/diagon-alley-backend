Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :addresses, only: []
      resources :items, only: []
      resources :users, only: []

      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
    end
  end
end
