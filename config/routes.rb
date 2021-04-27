Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :addresses, only: []
      resources :items, only: [:index, :show]
      resources :users, only: []
      resources :carts, only: [:create]

      post '/login', to: 'auth#create'
      post '/signup', to: 'users#create'
    end
  end
end
