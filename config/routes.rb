Rails.application.routes.draw do
  resources :comments
  root 'home_page#home'
  get 'home_page/home'
  
  resources :posts
end
