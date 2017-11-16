Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home'
  get 'home', to: 'static_pages#dashboard'

  root 'static_pages#home'
end
