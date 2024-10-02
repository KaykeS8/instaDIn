Rails.application.routes.draw do
  devise_for :users
  root "site#index"
  get '/site', to: 'site#index'
  resources :posts do 
    resources :likes, only: [:create, :destroy]
  end
end