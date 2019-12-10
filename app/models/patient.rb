class Patient < ApplicationRecord
    belongs_to :user
    has_many :goals
    has_many :patient_workouts
    has_many :workouts, through: :patient_workouts

    after_save :set_age, :set_bmi, :comprehensive_health_rating

    private
    
    def set_age
        now = Time.now.utc.to_date
        age = now.year - date.year - ((now.month > date.month || (now.month == date.month && now.day >= date.day)) ? 0 : 1)
        update_column(:age, age)
    end

    def set_bmi
        num = 730 * weight/height ** 2
        update_column(:bmi, num) 
    end

    def comprehensive_health_rating
        bmi_weighted = 0.8 * (100 - bmi)
        age_weighted = 0.2 * (150 - age)
        activity_weighted = 0.2 * (active_minutes)
        update_column(:health_score,  (bmi_weighted + age_weighted + activity_weighted).round)
    end
end



