Rails.application.routes.draw do
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  get '/ranking', to: 'goals#ranking'
  resources :goals
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users do
    member do
      get :following, :followers, :bookmarks, :setting, :posts
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :bookmarks, only: [:create, :destroy]
  resources :comments, only: [:create, :edit, :destroy]
end
