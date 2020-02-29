Rails.application.routes.draw do
  root 'home_page#home'
  get 'home_page/home'
  
  devise_for :users
  resources :users
  resources :tags
  resources :posts do
    member do
      get "points_up"
      get "points_down"
    end
  end
  resources :comments do
    member do
      get "points_up"
      get "points_down"
    end
  end
  resources :votes
end
