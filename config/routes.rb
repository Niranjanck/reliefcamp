Rails.application.routes.draw do
  resources :like_comments
  resources :reliefcamp_users
  devise_for :super_admins
  devise_for :information_admins
  devise_for :relief_camp_admins
  devise_for :collection_center_admins
  resources :center_requests do
    member do
      post :accept
    end
  end
  resources :center_items
  resources :camp_requests do
    member do
      post :accept
    end
  end
  resources :camp_items
  resources :relief_camps
  resources :notifications
  resources :items
  resources :collection_centers
  resources :collection_center_admins
  resources :relief_camp_admins
  resources :information_admins
  resources :admin
  resources :rc_admin
  resources :cc_admin
  resources :if_admin
  resources :user
  root "home#index"
  devise_for :users
  # get 'users/sign_out' => 'devise/sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
