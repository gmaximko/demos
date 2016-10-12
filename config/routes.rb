Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :coordinates
  root 'coordinates#index'
  get '/main', to: 'coordinates#main', as: 'user_root'
  get '/index', to: 'coordinates#index'
end
