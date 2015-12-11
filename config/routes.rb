Rails.application.routes.draw do
  root to: 'homepages#index'

  get '/devices/search', to: 'devices#search'
  resources :devices, only: [:new, :create, :edit, :update, :index, :show] do
    resources :updates, only: [:new, :create]
  end
  resources :users, only: [:new, :create, :show, :index]
  resources :requests, only: [:new, :create, :index]
  resources :categories, only: [:new, :create, :show, :index]
end
