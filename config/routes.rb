Rails.application.routes.draw do
  resources :subjects
  resources :courses
  resources :instructors
  root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
