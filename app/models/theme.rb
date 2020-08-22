class Theme < ApplicationRecord
    #Pagina para matéria, das traduções para tema acho que foi a que melhor se encaixou, por mais que nã otenha certeza se seria essa
    has_many :class, :teacher
    validates :name, :department presence: true
end
