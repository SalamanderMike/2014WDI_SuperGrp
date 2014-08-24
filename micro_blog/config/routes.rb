Rails.application.routes.draw do

  root to: 'users#index'

  resources :users do
    resources :posts
  end

  resources :users do
    resources :pages
  end

  resources :posts do
    resources :comments
  end

  # get 'posts', to: 'posts#index'
  # get 'posts/new', to: 'posts#new'
  # get 'posts/:id', to: 'posts#show'
  # get 'posts/:id/edit', to: 'posts#edit'
  get 'tags', to: 'tags#index'
  get 'tags/:id', to: 'tags#show'
  get 'users/:user_id/tags/:tag_id', to: 'tags#showbyuser'

  get 'pages', to: 'pages#index'


  # post 'posts/create', to: 'posts#create'
  # delete 'posts/:id', to: 'posts#delete'
  # put 'posts/:id', to: 'posts#update'

end

