class SessionController < ApplicationController
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
end
    
