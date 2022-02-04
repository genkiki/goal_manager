Rails.application.routes.draw do
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  get '/ranking', to: 'goals#ranking'

  resources :goals do
    member do
      get :following
    end
  end
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users do
    member do
      get :following, :followers, :follow, :unfollow, :bookmarks, :setting,
          :posts, :favorites, :notifications
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :update]
end
