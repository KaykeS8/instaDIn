Rails.application.routes.draw do
  devise_for :users
  root "site#index"
  get '/site', to: 'site#index'
  get '/posts', to: 'posts#index'
end