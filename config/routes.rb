Rails.application.routes.draw do
  devise_for :companies
  devise_for :users

  resources :companies do
    resources :jobs
  end
  
  get 'static_pages/homepage'
  get 'home', to: 'static_pages#dashboard'

  root 'static_pages#homepage'
end
