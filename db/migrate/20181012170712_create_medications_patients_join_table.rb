class CreateMedicationsPatientsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :medications_patients, id: false do |t|
       t.belongs_to :medication, index: true
       t.belongs_to :patient, index: true
     end
   end
end
