Rails.application.routes.draw do

  resources :notifications
  resources :deliveries
  resources :concerned_citizen_tickets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :destinations
  resources :codestatuses
  resources :member_details
  get :member_shape_list, to: 'member_details#member_shape_list'
  resources :member_contacts
  get 'activities/index'
  resources :profiles
  resources :groups do 
    resources :member_contacts
  end
  get :contact_list, to: 'member_contacts#contact_list'
  get :member_detail_list, to: 'member_details#member_detail_list'
  get :member_shape_log, to: 'member_details#member_shape_log'
  devise_for :users
  resources :contacts
  resources :codes do
    end
  resources :companies do
    end
  root to: 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
