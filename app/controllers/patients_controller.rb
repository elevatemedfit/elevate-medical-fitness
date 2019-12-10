class PatientsController < ApplicationController
    before_action :current_patient, :set_bmi, :age, :comprehensive_health_rating, except: %i[new create index]

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)
        if @patient.save
            PatientWorkout.create(patient_id: @patient.id, completed: false, workout_id: params[:workout_id])
            redirect_to @patient 
        else
            flash[:notice] = "There was a problem creating your patient!"
            render :new
        end
    end

    def update
        if @patient.update(patient_params)
            PatientWorkout.find_or_create_by(patient_id: @patient.id, workout_id: params[:patient][:workouts])
            redirect_to @patient
        else
            render :edit
        end
    end

    def destroy
        @patient.destroy
        redirect_to patients_path
    end

    def index
        @patients = Patient.all
    end

    private

    def current_patient
        @patient = Patient.find(params[:id])
    end

    def age
        now = Time.now.utc.to_date
        age = now.year - @patient.date.year - ((now.month > @patient.date.month || (now.month == @patient.date.month && now.day >= @patient.date.day)) ? 0 : 1)
        @patient.update(age: age)
    end

    def set_bmi
        num = 730 * @patient.weight/@patient.height ** 2
        @patient.update(bmi: num) 
    end

    def comprehensive_health_rating
        one = 0.8 * (100 - @patient.bmi)
        two = 0.2 * (150 - @patient.age)
        three = 0.2 * (@patient.active_minutes)
        health_score = (one + two + three).round
        @patient.update(health_score: health_score)
    end

    def patient_params
        params.require(:patient).permit(:name,
                                        :date,
                                        :physician,
                                        :condition,
                                        :height,
                                        :weight,
                                        :step_count,
                                        :cardio_fitness_level,
                                        :caloric_burn,
                                        :distance,
                                        :active_minutes,
                                        :precautions,
                                        :user_id,
                                        :bmi,
                                        :age)
    end
end

