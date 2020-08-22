Rails.application.routes.draw do
  resources :classes
  resources :themes
  resources :teachers
  resources :students
  get '/sign_up', to: 'users#index'
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#login'
  post '/themes', to: 'users#add_theme' #Rota para add matéria se o usuário for confirmado como secretária ou admin
  get '/themes', to: 'users#index_themes' #Rotas para mostrar todas as matérias que podem-se dar aulas depois de adicionadas
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#Erros:kind, admin
