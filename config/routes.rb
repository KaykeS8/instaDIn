Rails.application.routes.draw do
  devise_for :users
  root "site#index"
  get '/site', to: 'site#index'
  resources :posts do 
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :create, :destroy, :edit]
  end
  resources :profiles, param: :user_name
  resources :friends, only: [:index, :create, :destroy]
end