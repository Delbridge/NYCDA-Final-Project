Rails.application.routes.draw do

  root "favorites#calendar"

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # resources :users

# resources :favorites
  get 'favorites/index' => "favorites#index"
  get 'favorites/display' => "favorites#display"
  get 'favorite/:id' => "favorites#show"
  get 'favorites/edit' => "favorites#edit"
  get 'favorites/landing' => "favorites#landing"

  post "/search" => "application#search"
  post "/create" => "favorites#create"
  delete "/favorites/index" => "favorites#destroy",  as: 'favorites_destroy'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
