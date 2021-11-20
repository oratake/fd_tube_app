Rails.application.routes.draw do
  # root to: "home#top"
  resources :users, only: %i[index show]
  resources :videos, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  
  devise_scope :user do
    root 'users/sessions#new'
    post '/users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    delete 'users/:id', to: 'users/registrations#destroy'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :admin do
    get '/videos/:id', to: 'videos#edit'
    patch '/videos/:id', to: 'videos#update'
    resources :videos, only: %i[index new create show destroy]
    resources :s3files
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      resources :comments, except: %i[update]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
