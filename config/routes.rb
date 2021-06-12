Rails.application.routes.draw do
  get '/', to: 'goals#index'
  resources :goals, only: [:show, :index, :edit, :destroy, :new, :create]
  resources :tasks, only: [:show]
end
