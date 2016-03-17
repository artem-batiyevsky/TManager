Rails.application.routes.draw do
  get 'log_in' => 'sessions#new', :as => 'log_in'
  resources :sessions

  get 'sign_up' => 'users/new', :as => 'sign_up'
  root :to => 'users#new'
  resources :users
  match '/index', to: 'tasks#index', via: 'get'
  #root 'tasks#index'
  resources :tasks do
    get "delete"

  end

end
