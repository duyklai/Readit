Rails.application.routes.draw do
  root 'home_page#home'
  get 'home_page/home'
  
  resources :posts
end
