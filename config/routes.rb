Rails.application.routes.draw do
  root to: 'videos#index'
  resources :videos
  resources :s3files

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
