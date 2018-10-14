Rails.application.routes.draw do
  resources :users
  resources :subjects
  resources :courses
  resources :instructors
  root 'index#index' , as: :index_path

  get '/login', to: 'session#new'
  post '/login' ,to: 'session#login', as: :login_path
  get '/signup', to: 'users#new' ,as: :signup_path
  post '/signup', to: 'users#signup'
  post '/logout', to:'session#delete', as: :logout_path
end
