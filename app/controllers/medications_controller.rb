require 'pry'

class MedicationsController < ApplicationController

  def index
    @medications = Medication.all

    render json: MedicationSerializer.new(@medications).serialized_json

  end



  def show
  @medication = Medication.find(params[:id])

  render json: MedicationSerializer.new(@medication).serialized_json

  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      render json: MedicationSerializer.new(@medication).serialized_json
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  def update
  @medication = Medication.find(params[:id])
  if @medication.update_attributes(medication_params)
    render json: MedicationSerializer.new(@medication).serialized_json

  else
    render json: @medication.errors, status: :unprocessable_entity
  end
  end

  def destroy
  @medication = Medication.find(params[:id])
  if @medication.destroy
    render json: MedicationSerializer.new(@medication).serialized_json
      else
        render json: @medication.errors, status: :unprocessable_entity
      end
  end

  private

  def medication_params
  params.require(:medication).permit(:id, :name)
  end

end
