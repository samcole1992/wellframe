class PatientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :medications

  ## Custom reviews object for Doctor object
    def medications
      object.medications
    end
end
