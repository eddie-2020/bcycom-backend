Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[create]
      post "/login", to: "users#login"
      get "/auto_login", to: "users#auto_login"
      get "/users", to: "users#index"
      get "/user/:id", to: "users#show"

      resources :motorcycles, only: %i[index]
      get "/motorcycle/:id", to: "motorcycles#show"
      post "/motorcycle", to: "motorcycles#create"
      put "/motorcycle/:id", to: "motorcycles#update"
      delete "/motorcycle/:id", to: "motorcycles#destroy"

      resources :reservations, only: %i[index]
      get "/reservation/:id", to: "reservations#show"
      post "/getreservation/:id", to: "reservations#show"
      post "/reservation", to: "reservations#create"
      put "/reservation/:id", to: "reservations#update"
      delete "/reservation/:id", to: "reservations#destroy"
     end
  end
end
