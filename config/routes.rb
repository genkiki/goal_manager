Rails.application.routes.draw do
  get 'follows/follow', to: 'follows#follow'
  get 'follows/followed', to: 'follows#followed'
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  resources :goals
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
