Rails.application.routes.draw do
 
  
  resources :courses do
  	resources :students
  	resources :evaluations do  
  		resources :grades
      member do
        get 'set_grades'
      end
  	end
  end
  get 'home/index'
  root 'courses#index'
  devise_for :users, :only => [ :sessions]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
