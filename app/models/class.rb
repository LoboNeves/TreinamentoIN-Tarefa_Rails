class Class < ApplicationRecord
    has_many :student
    has_one :teacher
    has_one :theme
    validates :initials, :day_of_the_week, :time, :status presence: true
end
