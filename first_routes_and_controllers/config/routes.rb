Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:destroy, :index, :show, :update, :create]
  resources :artworks, only: [:destroy, :index, :show, :update, :create]
  resources :artwork_shares, only: [:destroy, :index, :show, :update, :create]


  # Defines the root path route ("/")
  # root "articles#index"

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit'
  # post '/users/:id', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

end
