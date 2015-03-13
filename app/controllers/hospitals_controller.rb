class HospitalsController < ApplicationController

  def index
    @hospitals = Hospital.all
  end

  def show
    @hospital = Hospital.find params[:id]
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.create hospital_params
    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully added!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @hospital = Hospital.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:id]
    @hospital.update_attributes hospital_params
    redirect_to hospital_path(@hospital)
  end

  def destroy
    @hospital = Hospital.find params[:id]
    @hospital.delete
    redirect_to hospitals_path
  end

  private
  def hospital_params
    params.require(:hospital).permit(:name, :address, :description)
  end
end
