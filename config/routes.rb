Rails.application.routes.draw do
  resources :wineries

  root to: 'visitors#index'
  devise_for :users
end
