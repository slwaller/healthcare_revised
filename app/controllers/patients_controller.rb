class PatientsController < ApplicationController

  def index
    @hospital = Hospital.find params[:hospital_id]
    @patient = Patient.all
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
end
