Rails.application.routes.draw do
  get '/', to: 'goals#index'
  get '/login', to: 'users#login'
  post '/login', to: 'users#signin'
  get '/login_easy', to: 'users#signin_easy'
  get '/logout', to: 'users#logout'
  get '/follow', to: 'users#follow'
  get '/follower', to: 'users#follower'
  # get '/profile', to: 'users#show'
  # post '/profile', to: 'users#edit'
  # patch '/profile/update', to: 'users#update'
  resources :goals, only: [:show, :index, :edit, :destroy, :new, :create]
  resources :tasks, only: [:show, :edit, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
end
