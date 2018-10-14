Rails.application.routes.draw do
  resources :users
  resources :subjects
  resources :courses
  resources :instructors
  root 'index#index'

  get '/login', to: 'index#login'
  post '/login' ,to: 'user#login', as: :login_path
  get '/signup', to: 'user#signup' ,as: :signup_path
end
