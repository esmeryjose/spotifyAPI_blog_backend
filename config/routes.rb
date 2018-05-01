Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'auth', to: "sessions#create"
      post 'login', to: "users#create"
    end
  end
end
