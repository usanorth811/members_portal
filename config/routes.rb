Rails.application.routes.draw do
  resources :codestatuses
  resources :member_details
  resources :member_contacts
  get 'activities/index'
  resources :profiles
  resources :groups do 
    resources :member_contacts
  end
  devise_for :users
  resources :contacts
  resources :codes do
    end
  resources :companies do
    end
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
