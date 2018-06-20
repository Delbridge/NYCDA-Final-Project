Rails.application.routes.draw do
 
  get 'favorites/index'
  get 'favorites/display'
  get 'favorites/show'
  get 'favorites/edit'

 devise_for :users, :controllers => { registrations: 'registratins' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :favorites
  root "users#index"

  post "/search" => "application#search"


   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
