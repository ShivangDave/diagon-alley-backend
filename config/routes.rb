Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :addresses
    end
  end
  namespace :api do
    namespace :v1 do
      resources :items
      resources :users
    end
  end
end
