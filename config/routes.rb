Rails.application.routes.draw do
  get 'posts/index' 
  get 'users/show'
  get 'rooms/index' 
  resources :posts

  devise_for :users
  root 'top#index'
  
  get 'users/account', to: 'users#account'
  get 'users/profile', to: 'users#profile'
  post 'users/profile'
  get 'room/show'
  post 'posts/new'
  post 'posts/show' 

  post 'posts/confirm' #確認画面
  post 'posts/back' 

  resources :rooms, only: [:index, :create, :new, :show] do
    collection do
      get :search, to: 'rooms#search'
    end
  end
end
