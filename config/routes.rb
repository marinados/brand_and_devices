Rails.application.routes.draw do
  root to: 'devices#index'

  resources :users, only: [:new, :create, :show, :index]

  resources :devices, only: [:new, :create, :edit, :update, :index, :show] do
    resources :updates, only: [:new, :create]
  end

  resources :users, only: [:new, :create, :show, :index]

  resources :requests, only: [:new, :create, :index]
end
