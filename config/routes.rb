Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
  resources :homes, only: :index
  resources :reactions, only: :create
  resources :users, only: :show do
    resources :talks, only: [:index, :show, :create]
    end
end
