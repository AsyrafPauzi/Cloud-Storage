Rails.application.routes.draw do

  resources :storages do 
    member do 
      get :download
    end
  end
  devise_for :admins
  devise_for :users
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end
devise_scope :admin do
    root :to => 'admins/sessions#new'
  end

  
  get '/admins', to: 'admins#index'

  resources :manages

  
end
