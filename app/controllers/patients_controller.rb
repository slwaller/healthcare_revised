class PatientsController < ApplicationController
  before_action :find_patient, only: 
         [:show, :edit, :update, :destroy]

  def index
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.all
  end

  def show
    @hospital = Hospital.find params[:hospital_id]
  end

  def new
    @patient = Patient.new
    @hospital = Hospital.find params[:hospital_id]
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new(patient_params)
      respond_to do |format|
        if @patient.save
          format.html { redirect_to hospital_path(@hospital), notice: 'Patient Successfully Checked In!' }
        else
          format.html { render :new }
        end
      end
  end

  def edit
    @hospital = Hospital.find params[:hospital_id]
  end
  
  def update
    @hospital = Hospital.find params[:hospital_id]
    if @patient.update_attributes patient_params
      redirect_to hospitals_path  
    else
      render :edit
    end
  end

 private

  def find_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :dob, :reason, :gender)
  end

end