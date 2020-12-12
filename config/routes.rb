Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    devise_scope :user do
      get 'companies', to: 'users/registrations#new_companies'
       get 'companies_details', to: 'users/regitsrations#new_companies_details'
         post 'companies', to: 'users/registrations#create_companies'
    end
      resources :orders, only: [:index,:new,:create,:edit,:update]
        resources :supports, only: [:index, :new, :create,:edit,:update,:show]
          resources :companies, only: [:index,:edit,:update]
            resources :companies_details, only: [:index,:edit,:update]
              resources :companies_types, only: [:index,:create,:edit,:update]
                resources :companies_correspondences, only: [:index,:create,:edit,:update]
                  resources :companies_statuses, only: [:index,:create,:edit,:update]
                    resources :project_cases, only: [:index,:new,:create,:edit,:update,:show]

end
