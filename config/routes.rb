Rails.application.routes.draw do
  root to: 'users#new'

  get  '/sign_in', to: 'sessions#new'
  post '/sign_in', to: "sessions#create"
  get  '/sign_out', to: "sessions#destroy"

  resources :users, only: [:new, :create]
  resources :groceries
end
