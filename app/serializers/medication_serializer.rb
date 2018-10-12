class MedicationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  # Easy enought to return all patients who use this medication

  # def medications
  #   object.medications
  # end
  
end
