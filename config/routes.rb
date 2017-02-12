# == Route Map
#
#           Prefix Verb   URI Pattern                      Controller#Action
#      session_new GET    /session/new(.:format)           session#new
#             root GET    /                                pages#index
#            users GET    /users(.:format)                 users#index
#                  POST   /users(.:format)                 users#create
#         new_user GET    /users/new(.:format)             users#new
#             user PATCH  /users/:id(.:format)             users#update
#                  PUT    /users/:id(.:format)             users#update
#            books GET    /books(.:format)                 books#index
#                  POST   /books(.:format)                 books#create
#         new_book GET    /books/new(.:format)             books#new
#        edit_book GET    /books/:id/edit(.:format)        books#edit
#             book GET    /books/:id(.:format)             books#show
#                  PATCH  /books/:id(.:format)             books#update
#                  PUT    /books/:id(.:format)             books#update
#                  DELETE /books/:id(.:format)             books#destroy
#     reservations GET    /reservations(.:format)          reservations#index
#                  POST   /reservations(.:format)          reservations#create
#  new_reservation GET    /reservations/new(.:format)      reservations#new
# edit_reservation GET    /reservations/:id/edit(.:format) reservations#edit
#      reservation GET    /reservations/:id(.:format)      reservations#show
#                  PATCH  /reservations/:id(.:format)      reservations#update
#                  PUT    /reservations/:id(.:format)      reservations#update
#                  DELETE /reservations/:id(.:format)      reservations#destroy
#         requests GET    /requests(.:format)              requests#index
#                  POST   /requests(.:format)              requests#create
#      new_request GET    /requests/new(.:format)          requests#new
#     edit_request GET    /requests/:id/edit(.:format)     requests#edit
#          request GET    /requests/:id(.:format)          requests#show
#                  PATCH  /requests/:id(.:format)          requests#update
#                  PUT    /requests/:id(.:format)          requests#update
#                  DELETE /requests/:id(.:format)          requests#destroy
#        dashboard GET    /dashboard(.:format)             users#show
#         borrowed GET    /borrowed(.:format)              users#borrowed
#         wishlist GET    /wishlist(.:format)              users#wishlist
#            login GET    /login(.:format)                 session#new
#                  POST   /login(.:format)                 session#create
#                  DELETE /login(.:format)                 session#destroy
#

Rails.application.routes.draw do
  get 'session/new'

  root :to=> 'books#index'
  resources :users, :only => [:new, :create, :update, :index]
  resources :books
  resources :reservations
  resources :requests

  get '/dashboard' => 'users#dashboard'
  get '/dashboard/search' => 'users#search'
  post '/dashboard/request' => 'users#make_request'
  post '/dashboard/request/cancel' => 'users#cancel_request'
  get '/dashboard/borrowed' => 'users#borrowed'
  get '/dashboard/wishlist' => 'users#wishlist'
  post '/dashboard/wishlist/add' => 'users#add_to_wishlist'
  post '/dashboard/wishlist/cancel' => 'users#cancel_favorite'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
