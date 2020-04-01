Rails.application.routes.draw do
  root 'home_page#home'
  get 'home_page/home'
  
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:show, :update]
  resources :tags, only: [:show, :create, :update, :destroy]
  resources :posts, except: :index do
    member do
      get "points_up"
      get "points_down"
    end
  end
  resources :comments, except: [:index, :show] do
    member do
      get "points_up"
      get "points_down"
    end
  end
  resources :votes, only: [:create, :update, :destroy]
end
