Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      root to: "users#login"
      resources :users
      resources :roles
      resources :leave_user
      post '/user/login', to: 'users#login'
    end
  end
end
  