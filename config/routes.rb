Rails.application.routes.draw do
  get 'posts/index' 
  get 'users/show'
  get 'rooms/index' 
  resources :rooms
  resources :posts
  devise_for :users
  root 'top#index'
  get 'search' => 'rooms#search'
  
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  post 'posts/confirm'
  post 'posts/back' 
end
