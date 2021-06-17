Rails.application.routes.draw do
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  resources :goals, only: [:show, :index, :edit, :destroy, :new, :create]
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users, only: [:index, :new, :create, :show]
end
