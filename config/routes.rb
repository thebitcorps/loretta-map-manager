Rails.application.routes.draw do
  resources :lots, only: [:update]
  get '/manager', to: 'lots#index', as: :manager
  resources :salesmen
  devise_for :users
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/about', to: 'pages#about'
end
