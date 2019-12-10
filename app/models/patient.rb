class Patient < ApplicationRecord
    belongs_to :user
    has_many :goals
    has_many :patient_workouts
    has_many :workouts, through: :patient_workouts
end



