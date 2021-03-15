Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :home
  get '/aboutus', to: 'home#aboutus'
  get '/profile', to: 'home#profile'
  
  resources :vehicles
  
  resources :users
  get '/show', to: 'users#show'

  resources :reservations

end
