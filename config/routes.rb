Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    devise_scope :user do
      get 'companies', to: 'users/registrations#new_companies'
      post 'companies', to: 'users/registrations#create_companies'
       get 'companies_details', to: 'users/registrations#new_companies_details'
       post 'companies_details', to: 'users/registrations#create_companies_details'
        get 'companies_types', to: 'users/registrations#new_companies_types'
        post 'companies_types', to: 'users/registrations#create_companies_types'
         get 'companies_correspondences', to: 'users/registrations#new_companies_correspondences'
         post 'companies_correspondences', to: 'users/registrations#create_companies_correspondences'
          get 'companies_statuses', to: 'users/registrations#new_companies_statuses'
          post 'companies_statuses', to: 'users/registrations#create_companies_statuses'
    end
      resources :orders, only: [:index,:new,:create,:edit,:update]
        resources :supports, only: [:index, :new, :create,:edit,:update,:show]
          resources :companies, only: [:index,:edit,:update]
            resources :companies_details, only: [:index,:edit,:update]
              resources :companies_types, only: [:index,:edit,:update]
                resources :companies_correspondences, only: [:index,:edit,:update]
                  resources :companies_statuses, only: [:index,:edit,:update]
                    resources :project_cases, only: [:index,:new,:edit,:update]

end
