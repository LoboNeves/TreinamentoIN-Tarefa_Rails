class Theme < ApplicationRecord
    #Pagina para matéria, das traduções para matéria acho que foi a que melhor se encaixou, por mais que não tenha certeza se seria essa
    has_many :class, :teacher, :pre_requirement
    validates :name, :department presence: true
end
