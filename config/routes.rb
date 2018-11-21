Rails.application.routes.draw do
  devise_for :accounts
  root to: 'home#index'
  scope module: :authenticated, path: :admin, as: :admin do
    root to: 'dashboard#index'
    resources :dashboard, only: [:index]
    resources :elections, except: [:index, :destroy]
  end
end
