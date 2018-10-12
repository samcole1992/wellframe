
This Rails project was bootstrapped with rails new PROJECT_NAME --api

To setup the project

  run rake db:create

  run bundle

  run rails s

The gem 'fast_jsonapi' is used for json serializing

# Create a medication
curl -XPOST -H 'Content-Type: application/json' -d '{ "medication": {"name":"Vitamin A"}}' http://localhost:3000/medications

# List all medications
curl -XGET -H 'Content-Type: application/json'
http://localhost:3000/medications

# List a medication
curl -XGET -H 'Content-Type: application/json'
http://localhost:3000/medications/MEDICATION_ID

# Update a medication
curl -XPATCH -H 'Content-Type: application/json' -d '{ "medication": {"name":"Vitamin L"}}' http://localhost:3000/medications/MEDICATION_ID

# Delete a medication
curl -XDELETE -H 'Content-Type: application/json'
http://localhost:3000/medications/MEDICATION_ID

# Assign a medication to a patient
curl -XPATCH -H 'Content-Type: application/json'
http://localhost:3000/medications/MEDICATION_ID/patients/PATIENT_ID/assign

# Remove a medication to a patient
curl -XPATCH -H 'Content-Type: application/json'
http://localhost:3000/medications/MEDICATION_ID/patients/PATIENT_ID/remove

# Create a patient
curl -XPOST -H 'Content-Type: application/json' -d '{ "patient": {"name":"James Dean"}}' http://localhost:3000/patients

# List all patients
curl -XGET -H 'Content-Type: application/json'
http://localhost:3000/patients

# List a patient their associated medication(s)
curl -XGET -H 'Content-Type: application/json'
http://localhost:3000/patients/PATIENT_ID

# Update a patient
curl -XPATCH -H 'Content-Type: application/json' -d '{ "patient": {"name":"Daffy Duck"}}' http://localhost:3000/patients/PATIENT_ID

# Delete a patient
curl -XDELETE -H 'Content-Type: application/json'
http://localhost:3000/patients/PATIENT_ID
