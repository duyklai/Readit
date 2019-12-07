Rails.application.routes.draw do
  root 'home_page#home'
  get 'home_page/home'
  
  devise_for :users
  resources :users, only: [:show]
  resources :posts
  resources :comments
end
