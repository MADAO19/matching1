Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
  resources :homes, only: :index
  resources :users, only: :show do
    resources :talks, only: [:index, :show]
    end
end
