Rails.application.routes.draw do
  root 'posts#index'
  get 'log_out' => 'sessions#destroy', as: 'log_out'
  get 'log_in' => 'sessions#new', as: 'log_in'
  get 'sign_up' => 'users#new', as: 'sign_up'
  get 'profile' => 'users#show', as: 'profile'

  resources :posts
  resources :users, only: %i[create edit update]
  resources :sessions, only: :create
end
