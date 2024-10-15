Rails.application.routes.draw do
  devise_for :users
  root "site#index"
  get '/site', to: 'site#index'
  resources :posts do 
    resources :likes, only: [:index, :create, :destroy]
    resources :comments, only: [:index, :create, :destroy, :edit]
  end
  resource :profile
end