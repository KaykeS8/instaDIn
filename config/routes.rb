Rails.application.routes.draw do
  get 'chat/index'
  get 'messages/index'
  devise_for :users
  root "site#index"
  get '/site', to: 'site#index'

  resources :posts do 
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :create, :destroy, :edit]
  end

  resources :profiles, param: :user_name
  get '/followers/:user_name', to: 'profiles#followers'
  get '/followings/:user_name', to: 'profiles#followings'
  
  resources :friends, only: [:new, :create, :destroy, :index]
  post '/friends/:id', to: 'friends#create'

  resources :chats, only: [:index, :create, :show] do 
    resources :messages 
  end
end