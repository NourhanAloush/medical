json.array!(@patients) do |patient|
  json.extract! patient, :patient_id, :clinic, :clinic_type
  json.url patient_url(patient, format: :json)
end