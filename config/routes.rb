Rails.application.routes.draw do
 
  devise_for :users

  resources :users
  root "favorites#index"

  resources :favorites

  post "/search" => "application#search"

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
