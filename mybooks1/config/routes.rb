Rails.application.routes.draw do


   root 'sessions#new'

   resources :players
   resources :bets
   resources :users
   resource :session, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end