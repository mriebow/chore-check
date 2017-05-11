Rails.application.routes.draw do
  root to: 'homes#index'
  resources :homes, only: [:index]
  resources :groups
  # resources :chores

  devise_for :users
  resources :users, except: [:new, :create]
    resources :chores
end
