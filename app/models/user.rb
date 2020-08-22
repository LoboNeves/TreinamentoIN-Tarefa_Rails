class User < ApplicationRecord
    has_secure_password #password_digest
    validates :name, :email, presence: true
    validates :password, presence: true, length: {minimum: 6, message: "Senha tem que ter no mínimo 6 caracteres"}
    validates :email, uniqueness: true,  format: { with: /\b[A-Z0-9._%a-z\-]+@id.uff\.br\z/,
        message: "Precisa ser uma conta do domínio @id.uff.br" } #Validação de email com domínio @id.uff.br
    #Parte para enumerar os tipos de usuários existentes
    enum kind:{
        admin: 0,
        student: 1,
        teacher: 2,
        secretary: 3
    }
    
    #Se o tipo não for selecionado, retornar como aluno
    if :kind == nil
        kind = 1
    #Se for estudante enviar para o controller de estudante
    elsif :kind == 1
        @user = @user.student
    #Se for professor enviar para o controller de professor
    else :kind == 2
        @user = @user.teacher
    end
end
