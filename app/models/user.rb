class User < ApplicationRecord
    has_secure_password #password_digest
    validates :name, :email, :kind, :password_digest, presence: true
    validates :email, uniqueness: true
#Parte para enumerar os tipos de usuários existentes
    enum kind:{
        admin: 0,
        student: 1,
        teacher: 2,
        secretary: 3  
    }
end
