Rails.application.routes.draw do
  resources :profiles
  resources :groups
  devise_for :users
  resources :contacts
  resources :codes
  resources :member_reps
  resources :billing_contacts
  resources :companies
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
