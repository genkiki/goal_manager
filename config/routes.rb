Rails.application.routes.draw do
  get 'follows/follow', to: 'follows#follow'
  get 'follows/followed', to: 'follows#followed'
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  get '/follow', to: 'users#follow'
  get '/follower', to: 'users#follower'
  resources :goals, only: [:show, :index, :edit, :destroy, :new, :create]
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
end
