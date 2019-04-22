Rails.application.routes.draw do
  get 'activities/index'
  resources :profiles
  resources :groups
  devise_for :users
  resources :contacts
  resources :codes do
    resources :contacts
  end
  resources :member_reps
  resources :billing_contacts
  resources :companies do
    resources :codes
  end
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
