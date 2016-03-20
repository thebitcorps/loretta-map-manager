Rails.application.routes.draw do
  resources :lots
  resources :salesmen
  devise_for :users
  root 'pages#home'
  get '/help', to: 'pages#help'
  get '/about', to: 'pages#about'
end
