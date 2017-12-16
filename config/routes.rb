Rails.application.routes.draw do
  get 'company_pages/homepage'

  get 'company_pages/home'

  get 'user_pages/home'

  devise_for :companies
  devise_for :users

  put 'jobs/:id/update_status', to: 'jobs#update_status', as: 'update_status'
  
  resources :jobs, only: [:show, :destroy]

  resources :companies do
    resources :jobs, only: [:new, :create, :edit, :update]
    resources :company_informations, only: [:new, :create, :edit, :update]
  end

  resources :categories, only: [:new, :create]
  
  get 'static_pages/homepage'

  root 'static_pages#homepage'
end
