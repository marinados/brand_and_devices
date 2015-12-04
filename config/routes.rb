Rails.application.routes.draw do
  resources :devices, only: [:new, :create, :show, :index]

  resources :users, only: [:new, :create, :show, :index]
end
