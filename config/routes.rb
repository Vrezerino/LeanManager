Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "api/v1/auth"
  root to: "lean#index"

  namespace :api do
    namespace :v1 do
      resources :users, param: :id
      resources :assets, param: :code
      resources :tickets, param: :id
      resources :customers, param: :id
      resources :orders, param: :id
      resources :bills, param: :id
    end
  end

  get "*path", to: "lean#index", via: :all
end
