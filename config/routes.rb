Rails.application.routes.draw do

  namespace :admin do
    get 'settings/general'
    get 'settings/writing'
    get 'settings/reading'
  end
  match 'login',to: 'admin/sessions#login', as: :login,via: [:get,:post]
  match 'lostpassword',to: 'admin/sessions#lostpassword', as: :lostpassword,via: [:get,:post]
  match 'logout',to: 'admin/sessions#logout', as: :logout,via: [:get,:post]
  
    namespace :admin do
        namespace :dashboard do
          get 'interview',as: :interview
          match 'update_core',to: 'admin/dashboard#update_core', as: :update_core,via: [:get,:post]
        end
        namespace :users do 
          get 'users',as: :users
          get 'new',as: :new_user
          get 'edit',as: :edit
          get 'destroy',as: :destroy_user
          get 'do_destroy',as: :do_destroy_user
          post 'update',as: :update
          post 'create',as: :create
        end
        namespace :posts do 
          get 'posts',as: :posts
          get 'new',as: :new
        end
    end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end