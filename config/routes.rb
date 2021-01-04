Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :destinations
  resources :codestatuses
  resources :member_details
  resources :member_contacts
  get 'activities/index'
  resources :profiles
  resources :groups do 
    resources :member_contacts
  end
  get :contact_list, to: 'member_contacts#contact_list'
  get :member_detail_list, to: 'member_details#member_detail_list'
  devise_for :users
  resources :contacts
  resources :codes do
    end
  resources :companies do
    end
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
