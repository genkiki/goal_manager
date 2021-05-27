Rails.application.routes.draw do
  get '/', to: 'goals#index'
  resources :goals, only: :show
end
