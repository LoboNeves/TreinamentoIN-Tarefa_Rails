Rails.application.routes.draw do
  post '/sign_up', to: 'register#sign_up'
  post '/login', to: 'session#login'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
