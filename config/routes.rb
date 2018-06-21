Rails.application.routes.draw do

  root "favorites#calendar"

  devise_for :users

  resources :users

# resources :favorites
  get 'favorites/index' => "favorites#index"
  get 'favorites/display' => "favorites#display"
  get 'favorite/:id' => "favorites#show"
  get 'favorites/edit'
  get '/guest' => "favorites#landing"


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  post "/search" => "application#search"
  post "/create" => "favorites#create"


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
