Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
   }
  devise_scope :users do
    delete "users/:id", to: "users/registrations#destroy"

  end

  resources :videos, only: [:index, :show]
  resources :users, only: [:index, :show]
  
  namespace :admin do
    get "/videos/:id", to: "videos#edit"
    patch "/videos/:id", to: "videos#update"
    resources :videos, only: [:index, :new, :create, :show, :destroy]
    resources :s3files
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
