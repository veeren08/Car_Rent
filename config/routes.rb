Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :home
  get '/aboutus', to: 'home#aboutus'
  get '/profile', to: 'home#profile'
  
  resources :users do
  	resources :vehicles
  end

  resources :reservations do
  	member do
      put 'pickup'
      put 'returncar'
      put 'cancel'
    end
  end

  patch 'reservations/:id/cancel' => 'reservations#cancel'
  post 'reservations/:id/cancel' => 'reservations#cancel'
  
  resources :waitinglists do
    member do
      put 'cancel'
    end
  end

end