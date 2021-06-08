Rails.application.routes.draw do
  get '/', to: 'goals#index'
  resources :goals, only: [:show, :index, :edit, :destroy]
  resources :tasks, only: [:show]
end
