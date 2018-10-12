require 'pry'
class PatientsController < ApplicationController
    def index

    @patients = Patient.all

    render json: PatientSerializer.new(@patients).serialized_json

    end

    def show
    @patient = Patient.find(params[:id])

    render json: PatientSerializer.new(@patient).serialized_json

    end

    def create
    @patient = Patient.new(patient_params)
      if @patient.save
        render json: PatientSerializer.new(@patient).serialized_json
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end

    def assign
      @patient = Patient.find(params[:patient_id])

      @medication = Medication.find(params[:medication_id])

      @patient.medications << @medication

      if @patient.save
        render json: PatientSerializer.new(@patient).serialized_json
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end
    def remove
      @patient = Patient.find(params[:patient_id])

      @medication = Medication.find(params[:medication_id])


      @patient.medications.delete(@medication)

      if @patient.save
        render json: PatientSerializer.new(@patient).serialized_json
      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end
    def update
      @patient = Patient.find(params[:id])

      if params([:medication_id])
        @medication = Medication.find(params[:medication_id])
        @medication.patient = @medication
      end
      if @patient.update_attributes(patient_params)
        render json: PatientSerializer.new(@patient).serialized_json

      else
        render json: @patient.errors, status: :unprocessable_entity
      end
    end

    def destroy
    @patient = Patient.find(params[:id])
    if @patient.destroy
      render json: PatientSerializer.new(@patient).serialized_json
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
    end

    private

  def patient_params
  params.require(:patient).permit(:id, :name, :updated_at)
  end
end
