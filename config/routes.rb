Rails.application.routes.draw do
  get 'user_pages/home'

  devise_for :companies
  devise_for :users

  resources :companies do
    resources :jobs
  end
  
  get 'static_pages/homepage'

  root 'static_pages#homepage'
end
