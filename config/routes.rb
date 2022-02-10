Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  resources :homes, only: :index
  resources :reactions, only: :create
  resources :users, only: [:show, :edit, :update] do
    resources :talks, only: [:index, :show, :create]
    end
end
