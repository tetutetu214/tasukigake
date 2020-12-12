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
    end
      resources :orders, only: [:index,:new,:create,:edit,:update]
        resources :supports, only: [:index, :new, :create,:edit,:update,:show]
          resources :companies, only: [:index,:edit,:update]
            resources :companies_details, only: [:index,:edit,:update]
              resources :companies_types, only: [:index,:edit,:update]
                resources :companies_correspondences, only: [:index,:create,:edit,:update]
                  resources :companies_statuses, only: [:index,:create,:edit,:update]
                    resources :project_cases, only: [:index,:new,:create,:edit,:update,:show]

end
