Fortytwo::Application.routes.draw do

  devise_for :users
   root 'pages#index'
   get "about" => 'pages#about'
   get "services" => 'pages#services'

  resources :requests

end
