Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :home
  get '/aboutus', to: 'home#aboutus'
  get '/profile', to: 'home#profile'
  
  # get '/reserve' => 'vehicle#reserve'
  # get 'vehicle/:id/reserve' => 'vehicle#reserve'
  resources :users do
  	resources :vehicles do
      resources :reserves
    end
  end

  # resources :reserves

  resources :reservations do
  	member do
      put 'returncar'
      put 'cancel'
    end
  end

  patch 'reservations/:id/cancel' => 'reservations#cancel'
  post 'reservations/:id/cancel' => 'reservations#cancel'
  
end