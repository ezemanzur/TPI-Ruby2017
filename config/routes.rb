Rails.application.routes.draw do
 
  resources :grades
  resources :evaluations
  resources :students
  resources :courses
  get 'home/index'
  root 'courses#index'
  devise_for :users, :only => [ :sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
