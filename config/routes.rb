Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get '/timeline', to: 'timeline#index'
end