Rails.application.routes.draw do

  # get 'passwords/new'

  get "/" => "session#new"
  post "/" => "session#create"
  root to: 'login#index'
  get "/login" => "session#new"
  post "/login" => "session#create"

  delete "/logout" => "session#destroy"
  get "/logout" => "session#destroy" #TODO: DELETE THIS BEFORE PRODUCTION

  resources :users do
    resources :posts
  end

  resources :users do
    resources :pages
  end

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :passwords
  
  # get 'posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new'
  # get 'posts/:id', to: 'posts#show'
  # get 'posts/:id/edit', to: 'posts#edit'
  get 'tags', to: 'tags#index'
  get 'tags/:id', to: 'tags#show'
  get 'users/:user_id/tags/:tag_id', to: 'tags#showbyuser'

  get 'pages', to: 'pages#index'
  get 'pages/:user_id', to: 'pages#show'

  get 'login', to: 'login#index'

  # post 'posts/create', to: 'posts#create'
  # delete 'posts/:id', to: 'posts#delete'
  # put 'posts/:id', to: 'posts#update'

end

