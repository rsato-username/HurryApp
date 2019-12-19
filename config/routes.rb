Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'fronts#index'

  resources :fronts, only: :index do
    collection do
      get :home
    end
  end

  resources :users, only: [:edit, :update]

  resources :orders, only: [:index, :new, :create] do
    collection do
      post :confirm
    end
  end

  resources :reviews, only: [:index, :new, :create]
  # resources :drinks, only: [:index]

  # resources :drinks, only: [:index, :new]
  # resources :fronts, only: :index
  # namespace :admin do
  #   resources :foods
  #   resources :drinks 
  #   resources :users 
  #   resources :orders 
  #   resources :reviews 
  #   resources :salespersons
  # end
end
