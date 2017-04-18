RailsHW::Application.routes.draw do
  root :to => 'users#new'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'posts' => 'posts#index', :as => 'posts'

  resources :posts
  resources :users, exclude: :new
  resources :sessions, only: :create
end
