class Student < ApplicationRecord
    belongs_to :user
    has_many :class
    validates :cr, :registration presence: true
end
