Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users
      resources :roles
      resources :complain
      resources :leave_user do 
        get :approve, on: :member
        get :unapprove, on: :member
        # put :approve , on: :member
      end
      # put '/approved/:id', to: 'leave_user#approved', as: :approved
      # put '/leave_user/approve/:id', to: 'leave_users#approve'
      post '/user/login', to: 'users#login'
        
        # put '/leave_user/approved', to: 'leave_user#approved'
        # put '/leave_user/unapproved', to: 'leave_user#unapproved'
    end
  end
end
  