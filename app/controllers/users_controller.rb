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
      render json: {error: "unauthorized"}, status: unauthorized
    end
    #Parte para confirmação de admin por email e senha
    if @user.kind == 0
        if @user.email = "admin@id.uff.br" && @user.password = "123456"
            token = JsonWebToken.encode(user_id: @user.id)
            render json: {token: token, user: @user}
        else
            render json: {error: "unauthorized"}, status: unauthorized
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :kind,:password,:password_confirmation, :password_digest)
    end
end
