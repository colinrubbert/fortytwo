Fortytwo::Application.routes.draw do

   root 'pages#index'
   get "about" => 'pages#about'
   get "services" => 'pages#services'
   get "pricing" => 'pages#pricing'

end
