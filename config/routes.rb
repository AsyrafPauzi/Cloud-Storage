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
  resources 'mains', :only => 'index'
  resources 'admins', :only => 'index'

 
end
