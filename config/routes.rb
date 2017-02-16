# == Route Map
#
#                    Prefix Verb   URI Pattern                          Controller#Action
#      pending_items_create GET    /pending_items/create(.:format)      pending_items#create
#               session_new GET    /session/new(.:format)               session#new
#                      root GET    /                                    books#index
#                     users GET    /users(.:format)                     users#index
#                           POST   /users(.:format)                     users#create
#                  new_user GET    /users/new(.:format)                 users#new
#                      user PATCH  /users/:id(.:format)                 users#update
#                           PUT    /users/:id(.:format)                 users#update
#                     books GET    /books(.:format)                     books#index
#                           POST   /books(.:format)                     books#create
#                  new_book GET    /books/new(.:format)                 books#new
#                 edit_book GET    /books/:id/edit(.:format)            books#edit
#                      book GET    /books/:id(.:format)                 books#show
#                           PATCH  /books/:id(.:format)                 books#update
#                           PUT    /books/:id(.:format)                 books#update
#                           DELETE /books/:id(.:format)                 books#destroy
#              reservations GET    /reservations(.:format)              reservations#index
#                           POST   /reservations(.:format)              reservations#create
#           new_reservation GET    /reservations/new(.:format)          reservations#new
#          edit_reservation GET    /reservations/:id/edit(.:format)     reservations#edit
#               reservation GET    /reservations/:id(.:format)          reservations#show
#                           PATCH  /reservations/:id(.:format)          reservations#update
#                           PUT    /reservations/:id(.:format)          reservations#update
#                           DELETE /reservations/:id(.:format)          reservations#destroy
#                  requests GET    /requests(.:format)                  requests#index
#                           POST   /requests(.:format)                  requests#create
#               new_request GET    /requests/new(.:format)              requests#new
#              edit_request GET    /requests/:id/edit(.:format)         requests#edit
#                   request GET    /requests/:id(.:format)              requests#show
#                           PATCH  /requests/:id(.:format)              requests#update
#                           PUT    /requests/:id(.:format)              requests#update
#                           DELETE /requests/:id(.:format)              requests#destroy
#                 dashboard GET    /dashboard(.:format)                 users#dashboard
#          dashboard_search GET    /dashboard/search(.:format)          users#search
#         dashboard_request POST   /dashboard/request(.:format)         users#make_request
#  dashboard_request_cancel POST   /dashboard/request/cancel(.:format)  users#cancel_request
#        dashboard_borrowed GET    /dashboard/borrowed(.:format)        users#borrowed
#        dashboard_wishlist GET    /dashboard/wishlist(.:format)        users#wishlist
#    dashboard_wishlist_add POST   /dashboard/wishlist/add(.:format)    users#add_to_wishlist
# dashboard_wishlist_cancel POST   /dashboard/wishlist/cancel(.:format) users#cancel_favorite
#                     login GET    /login(.:format)                     session#new
#                           POST   /login(.:format)                     session#create
#                           DELETE /login(.:format)                     session#destroy
#             pending_items POST   /pending_items(.:format)             pending_items#create
#

Rails.application.routes.draw do
  root :to=> 'books#index'
  resources :users, :only => [:new, :create, :update, :index, :edit, :destroy]
  resources :books
  resources :reservations
  resources :requests

  get '/dashboard' => 'users#dashboard'

  get '/dashboard/wishlist' => 'favorites#wishlist'
  post '/dashboard/wishlist/add' => 'favorites#add_to_wishlist'
  post '/dashboard/wishlist/cancel' => 'favorites#cancel_favorite'

  get '/dashboard/search' => 'books#search'
  get '/dashboard/borrowed' => 'books#borrowed'
  post '/dashboard/reservation/borrowed' => 'books#deliver'
  post '/return/:id' => 'reservations#return'

  post '/dashboard/request' => 'requests#make_request'
  delete '/dashboard/request/:id' => 'requests#cancel_request'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/pending_items' => 'pending_items#create'
  delete '/pending_items' => 'pending_items#destroy'
end
