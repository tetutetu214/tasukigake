Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users
      resources :orders, only: [:index]
      resources :companies, only: [:new,:create] do
        collection do
          get 'step1'
          get 'step2'
          get 'step3'
          get 'step4'
          get 'step5'
        end
      end
end
