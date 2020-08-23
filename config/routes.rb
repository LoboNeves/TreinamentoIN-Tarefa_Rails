Rails.application.routes.draw do
  resources :classes
  resources :themes
  resources :teachers
  resources :students
  resources :users
  get '/sign_up', to: 'users#index'
  post '/sign_up', to: 'users#create'
  post '/login', to: 'users#login'
  post '/themes', to: 'users#add_theme' #Rota para add matéria se o usuário for confirmado como secretária ou admin
  get '/themes', to: 'users#index_themes' #Rotas para mostrar todas as matérias que podem-se dar aulas depois de adicionadas
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#A funcionalidade do site está longe de perfeita, tive dificuldades de fazer todos os MVP's tendo chegando parcialmente até o 3, muitas coisas não funcionam e me confundi e fiz coisas erradas muitas vezes pelo caminho, reconheço os erros e as dificuldades que tive e espero que pelo menos parte da lógica que tentei implementar seja levada em consideração. Alguns erros:implementar o kind para o usuário, acesso de secretaria ou admin, sistema de requisitos e pré-requisitos