class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users #metodo onde um usuário só pode ser criado a partir do outro, como pedido no documento
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #Parte feita para controlar login de usuários
  def login
    @user = User.find_by(email: params[:user][:email])
    @user = @user&.authenticate(params[:user][:password])
    if @user
      token = JsonWebToken.encode(user_id: @user.id)
      render json: {token: token, user: @user}
    else
      render json: {error: "Acesso não autorizado"}
    end
    #Parte para confirmação de admin por email e senha
    if @user.kind == 0
        if @user.email = "admin@id.uff.br" && @user.password = "123456"
            token = JsonWebToken.encode(user_id: @user.id)
            render json: {token: token, user: @user}
        else
            render json: {error: "Acesso não autorizado"}
        end
    end 
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def index_themes #Função para mostrar as materias que o professor pode dar aula depois de a função de baixo add a materia
    @users.addtheme = addtheme.all

    render json: @users.addtheme
  end

  def add_theme #Função para add matéria, não tenho certeza se é assim que se deve fazer, espero que pelo menos a lógica senha considerada
    if kind == 0 || kind == 3
      render json: @user.add_theme #Parametro para adicionar materia quando usuário for confirmado como secretaria ou admin
      index_themes #Mostrar todas as materias que podem dar aula depois de ter adicionado uma nova.
    else
      render json: {error: "Sem permissão"}
    end
  end
  #Função para adicionar pré-requisito se a matéria for diferente da que se quer adicionar o pré-requisito
  def pre_requirement
    if kind == 0 || kind == 3
      if :prerequirement != @user.add_theme
        render json: @user.pre_requirement
      else
        render json: {error: "Não se pode adicionar a mesma matéria no pré-requisito dela"}
    end
  end

  def open_class #Tentativa da requisição do MVP3 de a secretaria poder abrir vagas de uma materia  na turma, mudando o status dela
    if kind == 3
      @class.status = :class_status
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params               #variaveis usadas para secretaria ou admin também se encontram aqui, não sei se era assim que tinha que fazer
      params.require(:user).permit(:pre_requirement, :class_status,:addtheme, :name, :email, :kind,:password,:password_confirmation, :password_digest)
    end
end
