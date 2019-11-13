Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'fronts#index'
  resources :users, only: [:index, :edit, :update]
  resources :orders, only: :index
  # resources :fronts, only: :index
end
