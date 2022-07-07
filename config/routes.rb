Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :users, only: %i[create]
    end
  end
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
