Rails.application.routes.draw do
  root :to=> 'pages#index'
  resources :users
  resources :books
  resources :reservations
  resources :requests

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
