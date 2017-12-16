Rails.application.routes.draw do
  get 'company_pages/homepage'

  get 'company_pages/home'

  get 'user_pages/home'

  devise_for :companies
  devise_for :users

  resources :companies do
    resources :jobs, only: [:new, :create]
  end

  resources :categories, only: [:new, :create]
  
  get 'static_pages/homepage'

  root 'static_pages#homepage'
end
