Rails.application.routes.draw do

   root 'welcome#index'
   resources :books
   resources :players
   resources :bets
   resources :users
   resource :session, only: [:new, :create, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
