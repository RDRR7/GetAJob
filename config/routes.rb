Rails.application.routes.draw do
  get 'user_informations/new'

  get 'user_informations/edit'

  get 'company_pages/homepage'

  get 'company_pages/home'

  get 'user_pages/home'

  devise_for :companies
  devise_for :users

  put 'jobs/:id/update_status', to: 'jobs#update_status', as: 'job_update_status'

  resources :jobs, only: [:index, :show, :destroy]

  resources :jobs do
    resources :interests, only: [:create]
  end
  
  resources :companies do
    resources :jobs, only: [:new, :create, :edit, :update]
    resources :company_informations, only: [:new, :create, :edit, :update]
  end
  
  resources :users do
    resources :user_informations, only: [:new, :create, :edit, :update]
  end
  
  put 'users/:id/update_status', to: 'user_informations#update_status', as: 'user_update_status'
  
  resources :categories, only: [:new, :create]
  
  get 'static_pages/homepage'

  root 'static_pages#homepage'
end
