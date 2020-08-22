class User < ApplicationRecord
    has_secure_password #password_digest
    validates :name, :email, presence: true
    validates :password, presence: true, length: {minimum: 6}
    validates :email, uniqueness: true
#Parte para enumerar os tipos de usuários existentes
    enum kind:{
        admin: 0,
        student: 1,
        teacher: 2,
        secretary: 3  
        #Se o tipo não for selecionado, retornar como aluno
        if kind == nil
            kind = 1
        #Se for estudante enviar para o controller de estudante
        if else kind == 1
            @user = @user.student
        #Se for professor enviar para o controller de professor
        if else kinf == 2
            @user = @user.teacher
        end
    }
end
