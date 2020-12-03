Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users
      resources :orders, only: [:index]
      resources :companies, only: [:index,:new,:create,:edit,:update,:destroy]
end
