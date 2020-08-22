class Teacher < ApplicationRecord
    belongs_to :user
    has_many :class, :theme
    validates :registration presence: true
end
