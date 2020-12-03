Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users
      resources :orders, only: [:index]
        resources :companies, only: [:index,:create]
          resources :companies_details, only: [:index,:create]

end
