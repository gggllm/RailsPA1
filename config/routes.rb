Rails.application.routes.draw do
  resources :segments
  resources :enrollments
  resources :users
  get '/users_courses', to: 'users#user_courses'
  get '/search_course', to: 'courses#search'
  get 'search_courses_list', to: 'courses#search_by_name_and_subject'
  post '/enroll/:course_id',to: 'users#enroll', as: :enroll_path
  post '/unenroll/:course_id',to: 'users#unenroll', as: :unenroll_path
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
