Rails.application.routes.draw do
  devise_for :accounts

  root to: 'home#index'

  scope module: :authenticated, path: :admin, as: :admin do
    root to: 'dashboard#index'
    resources :dashboard, only: [:index]
    resources :elections, except: [:index, :destroy]
  end

  resources :elections, only: [:show]
  resources :candidates, only: [:edit, :show]
  resources :voters, only: [:index]
  resources :vote, only: [:new, :create]
end
