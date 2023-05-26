Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'
  get '/movies', to: 'movies#index'
  get '/lists', to: 'lists#index'
  get 'lists/new', to: 'lists#new', as: :list_add
  post 'lists', to: 'lists#create'
  get 'lists/:id', to: 'lists#show', as: :list
  get 'bookmark/:movie_id/:list_id', to: 'bookmarks#new', as: :bookmark_new
  post 'bookmarks', to: 'bookmarks#create'
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: :bookmark_del
  delete 'lists/:id', to: 'lists#destroy', as: :delete_list
end
