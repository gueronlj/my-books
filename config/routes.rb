Rails.application.routes.draw do

   root 'welcome#index'
   resources :books
   resources :players
   resources :bets
   get '/bets/:book_id', to: 'bets#book_bets'
   resources :users
   resource :session, only: [:new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
