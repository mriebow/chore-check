Rails.application.routes.draw do
  root to: 'homes#index'
  resources :homes, only: [:index]
  resources :groups

  devise_for :users
  resources :users, except: [:new, :create]
end
