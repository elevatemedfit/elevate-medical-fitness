class PatientsController < ApplicationController
    

    def new
        @patient = Patient.new
    end

    def show
        @patient = Patient.find(params[:id])
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

