Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  # devise_for :users, controllers: {
    # registrations: 'users/registrations',
    # sessions: 'users/sessions'
  # }

  # devise_scope :user do
  #   get "sign_in", to: 'users/sessions#new'
  #   get "sign_out", to: "users/sessions#destroy" 
  # end
  
  resources :videos, only: [:index, :show]
  
  namespace :admin do
    resources :videos, only: [:index, :new, :create, :show,  :edit, :destroy]
    resources :s3files
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
