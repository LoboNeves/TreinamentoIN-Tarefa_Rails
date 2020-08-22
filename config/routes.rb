Rails.application.routes.draw do
  resources :teachers
  resources :students
  get '/sign_up', to: 'users#index'
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#Erros:kind, admin
