Rails.application.routes.draw do
  devise_for :users
  resources :comments
  root 'home_page#home'
  get 'home_page/home'
  
  resources :posts
end
