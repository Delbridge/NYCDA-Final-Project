Rails.application.routes.draw do

  devise_for :users

  resources :users
  root "favorites#index"

# resources :favorites
  get 'favorites/index' => "favorites#index"
  get 'favorites/display' => "favorites#display"
  get 'favorite/:id' => "favorites#show"
  get 'favorites/edit'

#  devise_for :users, :controllers => { registrations: 'registratins' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users

  root "users#index"

  post "/search" => "application#search"
  post "/create" => "favorites#create"


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
