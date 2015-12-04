Rails.application.routes.draw do

  root to: 'devices#index'

  resources :devices, only: [:new, :create, :edit, :update, :show, :index]

  resources :users, only: [:new, :create, :show, :index]
end
