json.array!(@patients) do |patient|
  json.extract! patient, :id, :clinic
  json.url patient_url(patient, format: :json)
end