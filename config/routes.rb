Rails.application.routes.draw do
 
  
  resources :courses do
    member do
        get 'result'
    end
  	resources :students 
  	resources :evaluations 
  end
  get 'home/index'
  root 'courses#index'
  devise_for :users, :only => [ :sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
