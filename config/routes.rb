Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :home
  get '/aboutus', to: 'home#aboutus'
  get '/profile', to: 'home#profile'
  get '/vehicles', to: 'vehicles#index'
  get '/owners', to: 'owners#index'
  get '/admins', to: 'admins#index'
end
