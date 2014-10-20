Rails.application.routes.draw do
  resources :vessels

  resources :wineries

  root to: 'visitors#index'
  devise_for :users
end
