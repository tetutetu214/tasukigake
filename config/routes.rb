Rails.application.routes.draw do
  root 'tops#index'
    devise_for :users
      resources :orders, only: [:index,:new,:create,:edit,:update]
        resources :supports, only: [:index, :show]
          resources :companies, only: [:index,:create,:edit,:update]
            resources :companies_details, only: [:index,:create,:edit,:update]
              resources :companies_types, only: [:index,:create,:edit,:update]
                resources :companies_correspondences, only: [:index,:create,:edit,:update]
                  resources :companies_statuses, only: [:index,:create,:edit,:update]
                    resources :project_case, only: [:index,:show]

end
