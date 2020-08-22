class Teacher < ApplicationRecord
    belongs_to :user
    has_many :class
    validates :registration presence: true
end
